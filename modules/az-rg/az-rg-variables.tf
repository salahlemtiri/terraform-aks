variable "name" {
  type        = string
  description = "This variable defines the name of the resource"
}

variable "location" {
  type        = string
  description = "This variable defines the location of the resource"
}

variable "tags" {
  type = object({         
    project     = string
    location    = string
    CreatedBy  = string
  })
  description = "This variable defines the resources tags"
}