variable "region" {
  description = "VPC region"
  default     = "us-west-1"
}


variable "vpc_cidr" {
  description = "VPC region"
   default     = "100.120.0.0/16"
}


variable "Pub_subnet_1_cidr" {
  description = "Public Subnet 1 Cidr block"
   default     = "100.120.1.0/24"
}

variable "Pub_subnet_tag_1" {
  description = "Public Subnet 1 tag"
   default    = "100.120.1.0/24"
}

variable "Pub_subnet_2_cidr" {
  description = "Public Subnet 2 Cidr block"
   default     = "100.120.2.0/24"
}

variable "Pub_subnet_tag_2" {
  description = "Public Subnet 2 tag"
   default    = "100.120.2.0/24"
}

variable "Priv_subnet_1_cidr" {
  description = "Private Subnet 1 Cidr block"
   default     = "100.120.3.0/24"
}

variable "Priv_subnet_tag_1" {
  description = "Private Subnet 1 tag"
   default    = "100.120.3.0/24"
}

variable "Priv_subnet_2_cidr" {
  description = "Private Subnet 2 Cidr block"
   default     = "100.120.4.0/24"
}

variable "Priv_subnet_tag_2" {
  description = "Private Subnet 2 tag"
   default    = "100.120.4.0/24"
}

variable "Prod-igw-association" {
  description = "Association of Internet Gateway"
   default     = "0.0.0.0/0"
}


variable "Prod-Nat-Association" {
  description = "Association of Gateway"
   default     = "0.0.0.0/0"
}