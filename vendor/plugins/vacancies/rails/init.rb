Refinery::Plugin.register do |plugin|
  plugin.title = "Vacancies"
  plugin.name = "vacancies"
  plugin.description = "Manage Vacancies"
  plugin.version = 1.0
  plugin.activity = {
    :class => Vacancy,
    :url_prefix => "edit",
    :title => 'job_title'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
