resource "google_bigquery_dataset" "this" {
  dataset_id                  = var.dataset_id
  project                     = var.project_id
  location                    = var.location
  description                 = var.description
  default_table_expiration_ms = var.table_expiration_ms
}

resource "google_bigquery_table" "tables" {
  for_each   = var.tables
  dataset_id = google_bigquery_dataset.this.dataset_id
  table_id   = each.key
  project    = var.project_id

  schema = jsonencode(each.value.schema)

  dynamic "time_partitioning" {
    for_each = each.value.partitioning != null ? [each.value.partitioning] : []
    content {
      type = time_partitioning.value
    }
  }
}
