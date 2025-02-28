variable "jira_api_token" {}
variable "jira_project_key" {}
variable "jira_url" {}
variable "env" {}


resource "null_resource" "drift_check" {
  provisioner "local-exec" {
    command = "terraform plan -detailed-exitcode || echo 'DRIFT_DETECTED' > drift.log"
  }
}

resource "null_resource" "jira_ticket" {
  depends_on = [null_resource.drift_check]

  provisioner "local-exec" {
    command = <<EOT
    if grep -q 'DRIFT_DETECTED' drift.log; then
      curl -X POST -H "Authorization: Bearer ${var.jira_api_token}" \
        -H "Content-Type: application/json" \
        --data '{ "fields": { "project": { "key": "${var.jira_project_key}" }, "summary": "Terraform Drift Detected", "description": "Infrastructure drift detected in environment ${var.env}", "issuetype": { "name": "Task" } } }' \
        "${var.jira_url}/rest/api/2/issue/"
    fi
    EOT
  }
}
