# This defines the values we're expecting per widget - see terraform.tfvars for the actual configured values
variable "config" {
    type = list(object({
        name = string
        domain = string
  }))
}

# This generates the 'rows' of widgets. They assume row 1 is the start row.
data "template_file" "widgets" {
    template = templatefile(
               "${path.module}/dashboards/composed_widgets.template.json",
               {
                 ACCOUNTID = var.accountId
                 CONFIG = var.config
               }
        )
}

# This is the dashboard outer container
data "template_file" "container" {
    template = templatefile(
               "${path.module}/dashboards/composed_container.template.json",
               {
                 WIDGETS = data.template_file.widgets.rendered
               }
        )
}

resource "newrelic_one_dashboard_json" "composed_dashboard" {
   json = data.template_file.container.rendered
}

#Lets tag terraform managed dashboards!
resource "newrelic_entity_tags" "composed_dashoard" {
    guid = newrelic_one_dashboard_json.composed_dashboard.guid
    tag {
        key = "terraform"
        values = [true]
    }
}

output "composed_dashboard" {
  value=newrelic_one_dashboard_json.composed_dashboard.permalink 
}

# uncomment this to see the json src thats composed (useful if you make a mistake!)
# output "composed_dashboard_src" {
#   value=data.template_file.container.rendered 
# }