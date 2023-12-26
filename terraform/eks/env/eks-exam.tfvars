account_id    = "655008341968"
region        = "ap-southeast-1"
environment   = "exam"
project       = "Mttl"

vpc_id           = "vpc-065bb373b9822ca0c"

subnet_ids = [
  "subnet-06fcff5a2f17852f6",
  "subnet-07cbc90571b96cde4",
  "subnet-0dcc5e44d2f896414"
]

control_plane_subnet_ids = [
  "subnet-0717fbd29e6da46dd",
  "subnet-0fcc5731d40516704",
  "subnet-08b7a71dfce47bf6b"
]

common_tags = {
  Project : "Mttl",
  Environment : "Exam",
  Terraform : "True"
}

