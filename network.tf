module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "7.0.0"

  project_id   = var.project_id
  network_name = "test-network"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = "test-subnet"
      subnet_ip             = "10.0.0.0/28"
      subnet_region         = "europe-west2"
      subnet_private_access = true
    }   
  ]
}
