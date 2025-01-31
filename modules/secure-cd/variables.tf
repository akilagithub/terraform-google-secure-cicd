/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type        = string
  description = "Project ID for CICD Pipeline Project"
  default = "acn-deliverylearning-devops"
}

variable "primary_location" {
  type        = string
  description = "Region used for key-ring"
  default = "us-central-1"
}

variable "manifest_wet_repo" {
  type        = string
  description = "Name of repo that contains hydrated K8s manifests files"
}

variable "gar_repo_name" {
  type        = string
  description = "Docker artifact registry repo to store app build images"
  default = "gcpregistryanthos"
}

variable "app_deploy_trigger_yaml" {
  type        = string
  description = "Name of application cloudbuild yaml file for deployment"
}

variable "deploy_branch_clusters" {
  type = map(object({
    cluster               = string
    project_id            = string
    location              = string
    required_attestations = list(string)
    env_attestation       = string
    next_env              = string
  }))
  description = "mapping of branch names to cluster deployments"
  default     = {}
}

variable "cache_bucket_name" {
  description = "cloud build artifact bucket name"
  type        = string
  default = "terraformbucket1"
}

variable "additional_substitutions" {
  description = "Parameters to be substituted in the build specification. All keys should begin with an underscore."
  type        = map(string)
  default     = {}
}

variable "cloudbuild_private_pool" {
  description = "Cloud Build private pool self-link"
  type        = string
  default     = ""
}
