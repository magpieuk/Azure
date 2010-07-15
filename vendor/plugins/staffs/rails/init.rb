Refinery::Plugin.register do |plugin|
  plugin.title = "Staffs"
  plugin.name = "staffs"
  plugin.description = "Manage Staffs"
  plugin.version = 1.0
  plugin.activity = {
    :class => Staff,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
