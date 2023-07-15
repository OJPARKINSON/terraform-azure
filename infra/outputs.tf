# API Token for SWA
output "api_token" {
  value = azurerm_static_site.web-app.api_key
}
