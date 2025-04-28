variable "ingress" {    
    description = "Ingress rules for the security group"
   type = list(number)
    default = [80, 443]
  
}
variable "egress" {    
    description = "Egress rules for the security group"
   type = list(number)
    default = [443, 80, 22] 
  
}