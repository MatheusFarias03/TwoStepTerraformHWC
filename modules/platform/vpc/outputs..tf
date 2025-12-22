output "vpc_id" {
  value = huaweicloud_vpc.vpc.id
}

output "availability_zone" {
  value = var.availability_zone
}

output "subnet_inside_id" {
  value = huaweicloud_vpc_subnet.subnet_inside.id
}
output "subnet_inside_ipv4_id" {
  value = huaweicloud_vpc_subnet.subnet_inside.ipv4_subnet_id
}
output "secgroup_inside_id" {
  value = huaweicloud_networking_secgroup.sec_group_inside.id
}

output "subnet_db_id" {
  value = huaweicloud_vpc_subnet.subnet_db.id
}
output "sec_group_db_id" {
  value = huaweicloud_networking_secgroup.sec_group_db.id
}