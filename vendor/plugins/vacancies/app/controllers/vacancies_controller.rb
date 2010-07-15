class VacanciesController < ApplicationController

  before_filter :find_all_vacancies
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @vacancy in the line below:
    present(@page)
  end

  def show
    @vacancy = Vacancy.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @vacancy in the line below:
    present(@page)
  end

protected

  def find_all_vacancies
    @vacancies = Vacancy.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/vacancies")
  end

end
