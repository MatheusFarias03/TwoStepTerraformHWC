output "vpc_id" {
  value = huaweicloud_vpc.vpc.id
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