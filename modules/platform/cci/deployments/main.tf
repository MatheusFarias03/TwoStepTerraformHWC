terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

# Inside's Workloads.
resource "huaweicloud_cciv2_namespace" "inside_namespace" {
  name = "inside-namespace"
}
resource "huaweicloud_cciv2_network" "inside_network" {
  namespace = huaweicloud_cciv2_namespace.inside_namespace.id
  name = "inside-network"
  annotations = {
    "yangtse.io/domain-id" : var.awesome_account_id
    "yangtse.io/project-id" : var.awesome_account_current_project_id
  }
  subnets {
    subnet_id = var.subnet_inside_ipv4_id
  }
  security_group_ids = [var.secgroup_inside_id]
}



# For each new workload, copy the entire section below (cciv2 deployment and hpa).

## Inside - Awesome
resource "huaweicloud_cciv2_deployment" "awesome_deployment" {
  depends_on = [ huaweicloud_cciv2_network.inside_network ]
  namespace = huaweicloud_cciv2_namespace.inside_namespace.id
  name = var.awesome_deployment_name

  delete_propagation_policy = "Foreground"

  selector {
    match_labels = {
      app = var.awesome_deployment_name
    }
  }

  replicas = 1

  template {
    metadata {
      labels = {
        app = var.awesome_deployment_name
      }
      annotations = {
        "logconf.k8s.io/fluent-bit-log-type" = "lts"
        "logconfigs.logging.openvessel.io"   = "{\"default-config\":{\"container_files\":{\"${var.awesome_deployment_name}\":\"stdout.log\"},\"lts-log-info\":{\"${var.cci_log_group_id}\":\"${var.awesome_stream_id}\"}}}"
      }
    }
    spec {
      containers {
        name = var.awesome_deployment_name
        image = "swr.la-north-2.myhuaweicloud.com/${var.organization_name}/${var.awesome_repo}:latest" # Update this later.
        resources {
          limits = {
            cpu = "1"
            memory = "2G"
          }
          requests = {
            cpu = "1"
            memory = "2G"
          }
        }
      }
      image_pull_secrets {
        name = "imagepull-secret"
      }
    }
  }

  strategy {
    type = "RollingUpdate"

    rolling_update = {
      maxUnavailable = "25%"
      maxSurge       = "100%"
    }
  }
}
resource "huaweicloud_cciv2_hpa" "awesome_hpa" {
  depends_on = [ huaweicloud_cciv2_deployment.awesome_deployment ]
  name = var.awesome_deployment_name
  namespace = huaweicloud_cciv2_namespace.inside_namespace.id
  min_replicas = 1
  max_replicas = 500
  scale_target_ref {
    kind = "Deployment"
    name = var.awesome_deployment_name
    api_version = "cci/v2"
  }
  metrics {
    type = "Resource"
    resources {
      name = "memory"
      target {
        type = "Utilization"
        average_utilization = 50
      }
    }
  }
  metrics {
    type = "Resource"
    resources {
      name = "cpu"
      target {
        type = "Utilization"
        average_utilization = 50
      }
    }
  }
}