# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

# None

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "What to name the cluster and all of its associated resources"
  type        = string
  default     = ""
}

variable "server_instance_type" {
  description = "What kind of instance type to use for the nomad servers"
  type        = string
  default     = "t2.micro"
}

variable "instance_type" {
  description = "What kind of instance type to use for the nomad clients"
  type        = string
  default     = "t2.micro"
}

variable "num_servers" {
  description = "The number of server nodes to deploy. We strongly recommend using 3 or 5."
  type        = number
  default     = 3
}

variable "num_clients" {
  description = "The number of client nodes to deploy. You can deploy as many as you need to run your jobs."
  type        = number
  default     = 2
}

variable "cluster_tag_key" {
  description = "The tag the EC2 Instances will look for to automatically discover each other and form a cluster."
  type        = string
  default     = ""
}

variable "cluster_tag_value" {
  description = "Add a tag with key var.cluster_tag_key and this value to each Instance in the ASG. This can be used to automatically find other Consul nodes and form a cluster."
  type        = string
  default     = ""
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the VPC in which the nodes will be deployed.  Uses default VPC if not supplied."
  type        = string
  default     = ""
}

#########################
# Honest Deed Variables #
#########################

variable "private_subnets" {
  description = "IDs of the private subnets in a VPC"
  type = list(string)
  default = [""]
}

variable "allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into Nomad/Consul Servers/Clients"
  type = list(string)
  default = [""]
}

variable "allowed_inbound_cidr_blocks" {
  description = "CIDR blocks allowed to send traffic into Nomad/Consule Servers/Clients"
  type = list(string)
  default = [""]
}


variable "server_ami_id" {
  description = "The ID of the AMI to run in the cluster for servers."
  type        = string
  default     = ""
}


variable "client_ami_id" {
  description = "The ID of the AMI to run in the cluster for clients."
  type        = string
  default     = ""
}