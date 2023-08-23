resource "aws_vpc" "PROJ-VPC" {
  cidr_block       = "100.120.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "PROJ-VPC"
  }
}

# Project7 creating Public Subnet1
resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id     = aws_vpc.PROJ-VPC.id
  cidr_block = "100.120.1.0/24"

  tags = {
    Name = "Prod-pub-sub1"
  }
}

# Project7 creating Public Subnet2
resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id     = aws_vpc.PROJ-VPC.id
  cidr_block = "100.120.2.0/24"

  tags = {
    Name = "Prod-pub-sub2"
  }
}

# Project7  creating Private Subnet1
resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id     = aws_vpc.PROJ-VPC.id
  cidr_block = "100.120.3.0/24"

  tags = {
    Name = "Prod-priv-sub1"
  }
}

# Project7 creating Private Subnet2
resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id     = aws_vpc.PROJ-VPC.id
  cidr_block = "100.120.4.0/24"

  tags = {
    Name = "Prod-priv-sub2"
  }
}

# Project7 creating a Public Route Table
resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.PROJ-VPC.id
  tags   = {
    Name = "Prod-public.route-table"
  
  }
}

# Project7 CREATING Private Route Table
resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.PROJ-VPC.id
  tags   = {
    Name = "Prod-priv-route-table"
  }
}


#PROJECT7 CREATING iNTERNET GATEWAY IGW
resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.PROJ-VPC.id

  tags = {
    Name = "Prod-igw"
  }
}

# Associate the internet gateway with the public route table
resource "aws_route" "Prod-igw-association" {
  route_table_id            = aws_route_table.Prod-pub-route-table.id
  gateway_id                = aws_internet_gateway.Prod-igw.id
  destination_cidr_block    = "0.0.0.0/0"

  }

# ProJect7 Public subnet Association
resource "aws_route_table_association" "Prod-public-route-association1" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

# ProJect7 Public subnet Association
resource "aws_route_table_association" "Prod-public-route-association2" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

# ProJect7 Private subnet Association
resource "aws_route_table_association" "Prod-private-route-association1" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

# ProJect7 Private subnet Association
resource "aws_route_table_association" "Prod-private-route-association2" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}


 # Project7  #Project7 Creating NAT gateway
resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.PROJ-EIP.id
  subnet_id     = aws_subnet.Prod-pub-sub1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}

#Allocation of Elastic IP
resource "aws_eip" "PROJ-EIP" {
}

#Project7 Associate with a private route table.
resource "aws_route" "Prod-Nat-Association" {
  route_table_id            = aws_route_table.Prod-priv-route-table.id
  gateway_id                = aws_nat_gateway.Prod-Nat-gateway.id
  destination_cidr_block    = "0.0.0.0/0"
  }
