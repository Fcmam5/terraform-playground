resource "docker_container" "php-httpd" {
  name     = "webserver"
  hostname = "php-httpd"
  image    = docker_image.php-httpd-image.name

  networks = [docker_network.private_network.id]
  ports {
    internal = 80
    external = 80
  }

  labels {
    label = "challenge"
    value = "second"
  }
  volumes {
    volume_name    = "volume"
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }

}

resource "docker_container" "phpmyadmin" {
  name     = "db_dashboard"
  hostname = "phpmyadmin"
  image    = "phpmyadmin/phpmyadmin"
  links    = [docker_container.mariadb.name]
  networks = [docker_network.private_network.id]
  ports {
    internal = 80
    external = 8081
  }

  labels {
    label = "challenge"
    value = "second"
  }
  volumes {
    volume_name    = "volume"
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }

  depends_on = [
    docker_container.mariadb
  ]
}
resource "docker_container" "mariadb" {
  name     = "db"
  hostname = "db"
  image    = docker_image.mariadb-image.name

  networks = [docker_network.private_network.id]
  ports {
    internal = 3306
    external = 3306
  }

  labels {
    label = "challenge"
    value = "second"
  }
  volumes {
    volume_name    = docker_volume.mariadb_volume.name
    container_path = "/var/lib/mysql"
    host_path      = "/var/lib/mysql"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=1234", "MYSQL_DATABASE=simple-website"
  ]

}
