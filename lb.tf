resource "fakewebservices_load_balancer" "primary_lb" {
  name = "Primary Load Balancer"
  servers = fakewebservices_server.servers[*].name
}