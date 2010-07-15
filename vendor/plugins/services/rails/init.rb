Refinery::Plugin.register do |plugin|
  plugin.title = "Services"
  plugin.name = "services"
  plugin.description = "Manage Services"
  plugin.version = 1.0
  plugin.activity = {
    :class => Service,
    :url_prefix => "edit",
    :title => 'title'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
