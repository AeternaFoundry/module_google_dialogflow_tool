output "dialogflow_tools_id" {
  description = "Map of id values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no id are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dialogflow_tools_action_confirmation_requirement" {
  description = "Map of action_confirmation_requirement values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no action_confirmation_requirement are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.action_confirmation_requirement if v.action_confirmation_requirement != null && length(v.action_confirmation_requirement) > 0 }
}
output "dialogflow_tools_connector_spec" {
  description = "Map of connector_spec values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no connector_spec are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => one(v.connector_spec) if v.connector_spec != null && length(v.connector_spec) > 0 }
}
output "dialogflow_tools_create_time" {
  description = "Map of create_time values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no create_time are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "dialogflow_tools_deletion_policy" {
  description = "Map of deletion_policy values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dialogflow_tools_description" {
  description = "Map of description values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no description are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.description if v.description != null && length(v.description) > 0 }
}
output "dialogflow_tools_display_name" {
  description = "Map of display_name values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no display_name are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "dialogflow_tools_function_spec" {
  description = "Map of function_spec values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no function_spec are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => one(v.function_spec) if v.function_spec != null && length(v.function_spec) > 0 }
}
output "dialogflow_tools_location" {
  description = "Map of location values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no location are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.location if v.location != null && length(v.location) > 0 }
}
output "dialogflow_tools_name" {
  description = "Map of name values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no name are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dialogflow_tools_open_api_spec" {
  description = "Map of open_api_spec values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no open_api_spec are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => one(v.open_api_spec) if v.open_api_spec != null && length(v.open_api_spec) > 0 }
  sensitive   = true
}
output "dialogflow_tools_project" {
  description = "Map of project values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no project are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.project if v.project != null && length(v.project) > 0 }
}
output "dialogflow_tools_satisfies_pzi" {
  description = "Map of satisfies_pzi values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no satisfies_pzi are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.satisfies_pzi if v.satisfies_pzi != null }
}
output "dialogflow_tools_satisfies_pzs" {
  description = "Map of satisfies_pzs values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no satisfies_pzs are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.satisfies_pzs if v.satisfies_pzs != null }
}
output "dialogflow_tools_tool_id" {
  description = "Map of tool_id values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no tool_id are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.tool_id if v.tool_id != null && length(v.tool_id) > 0 }
}
output "dialogflow_tools_tool_key" {
  description = "Map of tool_key values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no tool_key are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.tool_key if v.tool_key != null && length(v.tool_key) > 0 }
}
output "dialogflow_tools_update_time" {
  description = "Map of update_time values across all dialogflow_tools, keyed the same as var.dialogflow_tools except keys with no update_time are omitted"
  value       = { for k, v in google_dialogflow_tool.dialogflow_tools : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

