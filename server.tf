resource "fakewebservices_server" "servers" {
  count = 2

  name = "Server ${count.index+1}"
  type = "t2.micro"
  vpc = fakewebservices_vpc.primary_vpc.name
}