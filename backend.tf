terraform {
  backend "s3" {
    bucket         = "methii"
    key            = "backend-tf-state"
    region         = "us-east-1"
    
  }
}
