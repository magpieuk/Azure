class Admin::VacanciesController < Admin::BaseController

  crudify :vacancy, :title_attribute => :job_title

end
