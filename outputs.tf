output "dataset_id" {
  value = google_bigquery_dataset.this.dataset_id
}

output "table_ids" {
  value = [for t in google_bigquery_table.tables : t.table_id]
}