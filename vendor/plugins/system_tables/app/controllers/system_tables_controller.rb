class SystemTablesController < ApplicationController

  before_filter :find_all_system_tables
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @system_table in the line below:
    present(@page)
  end

  def show
    @system_table = SystemTable.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @system_table in the line below:
    present(@page)
  end

protected

  def find_all_system_tables
    @system_tables = SystemTable.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/system_tables")
  end

end
