provider "aws" {
    region = "us-east-1"
}
resource "aws_iam_user" "name" {
  name = "example"
}
resource "aws_iam_user" "met" {
  name = "exam-ple"
}
