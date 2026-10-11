resource "google_dialogflow_tool" "dialogflow_tools" {
  for_each = var.dialogflow_tools

  location                        = each.value.location
  tool_key                        = each.value.tool_key
  action_confirmation_requirement = each.value.action_confirmation_requirement
  deletion_policy                 = each.value.deletion_policy
  description                     = each.value.description
  display_name                    = each.value.display_name
  project                         = each.value.project
  tool_id                         = each.value.tool_id

  dynamic "connector_spec" {
    for_each = each.value.connector_spec != null ? [each.value.connector_spec] : []
    content {
      dynamic "actions" {
        for_each = connector_spec.value.actions
        content {
          connection_action_id = actions.value.connection_action_id
          dynamic "entity_operation" {
            for_each = actions.value.entity_operation != null ? [actions.value.entity_operation] : []
            content {
              entity_id = entity_operation.value.entity_id
              operation = entity_operation.value.operation
            }
          }
          input_fields  = actions.value.input_fields
          output_fields = actions.value.output_fields
        }
      }
      name = connector_spec.value.name
    }
  }

  dynamic "function_spec" {
    for_each = each.value.function_spec != null ? [each.value.function_spec] : []
    content {
      input_schema  = function_spec.value.input_schema
      method_type   = function_spec.value.method_type
      output_schema = function_spec.value.output_schema
    }
  }

  dynamic "open_api_spec" {
    for_each = each.value.open_api_spec != null ? [each.value.open_api_spec] : []
    content {
      dynamic "authentication" {
        for_each = open_api_spec.value.authentication != null ? [open_api_spec.value.authentication] : []
        content {
          dynamic "api_key_config" {
            for_each = authentication.value.api_key_config != null ? [authentication.value.api_key_config] : []
            content {
              api_key                    = api_key_config.value.api_key
              key_name                   = api_key_config.value.key_name
              request_location           = api_key_config.value.request_location
              secret_version_for_api_key = api_key_config.value.secret_version_for_api_key
            }
          }
          dynamic "bearer_token_config" {
            for_each = authentication.value.bearer_token_config != null ? [authentication.value.bearer_token_config] : []
            content {
              secret_version_for_token = bearer_token_config.value.secret_version_for_token
              token                    = bearer_token_config.value.token
            }
          }
          dynamic "oauth_config" {
            for_each = authentication.value.oauth_config != null ? [authentication.value.oauth_config] : []
            content {
              client_id                        = oauth_config.value.client_id
              client_secret                    = oauth_config.value.client_secret
              oauth_grant_type                 = oauth_config.value.oauth_grant_type
              scopes                           = oauth_config.value.scopes
              secret_version_for_client_secret = oauth_config.value.secret_version_for_client_secret
              token_endpoint                   = oauth_config.value.token_endpoint
            }
          }
          dynamic "service_agent_auth_config" {
            for_each = authentication.value.service_agent_auth_config != null ? [authentication.value.service_agent_auth_config] : []
            content {
              service_agent_auth = service_agent_auth_config.value.service_agent_auth
            }
          }
        }
      }
      dynamic "service_directory_config" {
        for_each = open_api_spec.value.service_directory_config != null ? [open_api_spec.value.service_directory_config] : []
        content {
          service = service_directory_config.value.service
        }
      }
      text_schema = open_api_spec.value.text_schema
      dynamic "tls_config" {
        for_each = open_api_spec.value.tls_config != null ? [open_api_spec.value.tls_config] : []
        content {
          dynamic "ca_certs" {
            for_each = tls_config.value.ca_certs
            content {
              cert         = ca_certs.value.cert
              display_name = ca_certs.value.display_name
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

