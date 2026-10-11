variable "dialogflow_tools" {
  description = <<EOT
Map of dialogflow_tools, attributes below
Required:
    - location
    - tool_key
Optional:
    - action_confirmation_requirement
    - deletion_policy
    - description
    - display_name
    - project
    - tool_id
    - connector_spec (block):
        - actions (required, block):
            - connection_action_id (optional)
            - entity_operation (optional, block):
                - entity_id (required)
                - operation (required)
            - input_fields (optional)
            - output_fields (optional)
        - name (required)
    - function_spec (block):
        - input_schema (optional)
        - method_type (optional)
        - output_schema (optional)
    - open_api_spec (block):
        - authentication (optional, block):
            - api_key_config (optional, block):
                - api_key (optional)
                - key_name (required)
                - request_location (required)
                - secret_version_for_api_key (optional)
            - bearer_token_config (optional, block):
                - secret_version_for_token (optional)
                - token (optional)
            - oauth_config (optional, block):
                - client_id (required)
                - client_secret (optional)
                - oauth_grant_type (required)
                - scopes (optional)
                - secret_version_for_client_secret (optional)
                - token_endpoint (required)
            - service_agent_auth_config (optional, block):
                - service_agent_auth (optional)
        - service_directory_config (optional, block):
            - service (required)
        - text_schema (required)
        - tls_config (optional, block):
            - ca_certs (required, block):
                - cert (required)
                - display_name (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location                        = string
    tool_key                        = string
    action_confirmation_requirement = optional(map(string))
    deletion_policy                 = optional(string)
    description                     = optional(string)
    display_name                    = optional(string)
    project                         = optional(string)
    tool_id                         = optional(string)
    connector_spec = optional(object({
      actions = list(object({
        connection_action_id = optional(string)
        entity_operation = optional(object({
          entity_id = string
          operation = string
        }))
        input_fields  = optional(list(string))
        output_fields = optional(list(string))
      }))
      name = string
    }))
    function_spec = optional(object({
      input_schema  = optional(string)
      method_type   = optional(string)
      output_schema = optional(string)
    }))
    open_api_spec = optional(object({
      authentication = optional(object({
        api_key_config = optional(object({
          api_key                    = optional(string)
          key_name                   = string
          request_location           = string
          secret_version_for_api_key = optional(string)
        }))
        bearer_token_config = optional(object({
          secret_version_for_token = optional(string)
          token                    = optional(string)
        }))
        oauth_config = optional(object({
          client_id                        = string
          client_secret                    = optional(string)
          oauth_grant_type                 = string
          scopes                           = optional(list(string))
          secret_version_for_client_secret = optional(string)
          token_endpoint                   = string
        }))
        service_agent_auth_config = optional(object({
          service_agent_auth = optional(string)
        }))
      }))
      service_directory_config = optional(object({
        service = string
      }))
      text_schema = string
      tls_config = optional(object({
        ca_certs = list(object({
          cert         = string
          display_name = string
        }))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_tools : (
        v.connector_spec == null || (length(v.connector_spec.actions) >= 1)
      )
    ])
    error_message = "Each actions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_tools : (
        v.open_api_spec == null || (v.open_api_spec.tls_config == null || (length(v.open_api_spec.tls_config.ca_certs) >= 1))
      )
    ])
    error_message = "Each ca_certs list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_tools : (
        v.function_spec == null || (v.function_spec.input_schema == null || (can(jsondecode(v.function_spec.input_schema))))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_tools : (
        v.function_spec == null || (v.function_spec.output_schema == null || (can(jsondecode(v.function_spec.output_schema))))
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

