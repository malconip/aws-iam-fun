variable "username" {
  type    = list(any)
  default = ["obi-wan-kenobi", "anakin"]
}

variable "readonlyusername" {
  type    = list(any)
  default = ["former2"]
}

variable "region" {
  default = "us-east-1"
}
