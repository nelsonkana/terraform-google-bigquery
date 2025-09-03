# terraform-google-bigquery

Reusable Terraform module for creating BigQuery datasets and tables.

## Example

```hcl
module "bq_dataset" {
  source       = "github.com/<your-username>/terraform-google-bigquery?ref=v1.0.0"
  dataset_id   = "analytics"
  location     = "US"
  description  = "Analytics dataset"
  tables = {
    events = {
      schema = [
        { name = "event_id", type = "STRING", mode = "REQUIRED" },
        { name = "timestamp", type = "TIMESTAMP", mode = "REQUIRED" }
      ]
    }
  }
}