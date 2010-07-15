class ServicesController < ApplicationController

  before_filter :find_all_services
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @service in the line below:
    present(@page)
  end

  def show
    @service = Service.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @service in the line below:
    present(@page)
  end

protected

  def find_all_services
    @services = Service.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/services")
  end

end
