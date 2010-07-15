Refinery::Plugin.register do |plugin|
  plugin.title = "System Tables"
  plugin.name = "system_tables"
  plugin.description = "Manage System Tables"
  plugin.version = 1.0
  plugin.activity = {
    :class => SystemTable,
    :url_prefix => "edit",
    :title => 'name'
  }
  plugin.menu_match = /(admin|refinery)\/(system_tables|locations|categories)?$/
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
