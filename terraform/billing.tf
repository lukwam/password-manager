data "google_billing_account" "default" {
  display_name = var.billing_account_display_name
  open         = true
}
output "default_billing_account" {
  value = data.google_billing_account.default.id
}
