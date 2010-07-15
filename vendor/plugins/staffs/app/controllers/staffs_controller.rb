class StaffsController < ApplicationController

  before_filter :find_all_staffs
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @staff in the line below:
    present(@page)
  end

  def show
    @staff = Staff.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @staff in the line below:
    present(@page)
  end

protected

  def find_all_staffs
    @staffs = Staff.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/staffs")
  end

end
