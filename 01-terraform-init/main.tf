resource "random_uuid" "unique_id" {
  
}

resource "aws_s3_bucket" "capstone_tf_state_bucket" {
  bucket = "capstone-tf-state-${random_uuid.unique_id.result}"
  
  tags   = {
    Name        = "capstone-tf-state-bucket"
    Environment = var.environment
  }
  
  lifecycle {
    // protect resource from being accidentally destroyed on destroy comman  
    prevent_destroy = true
  }
}