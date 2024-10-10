terraform {
  backend "s3" {
    bucket = "kwesi-ket-state001"
    key = "kwesi-ket-state001/terraform.tfstate"
  }
}