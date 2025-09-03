variable "dataset_id" {
  description = "The ID of the BigQuery dataset."
  type        = string
}

variable "location" {
  description = "Location for the dataset (e.g. US, EU)."
  type        = string
  default     = "US"
}

variable "description" {
  description = "Dataset description."
  type        = string
  default     = ""
}

variable "table_expiration_ms" {
  description = "Default expiration for tables in ms."
  type        = number
  default     = null
}

variable "tables" {
  description = "Map of tables with schema and optional partitioning."
  type = map(object({
    schema       = list(object({ name = string, type = string, mode = string }))
    partitioning = optional(string)
  }))
  default = {}
}

variable "project_id" {
  description = "The GCP project ID for the dataset"
  type        = string
}