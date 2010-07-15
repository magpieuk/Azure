class LocationsController < ApplicationController

  before_filter :find_all_locations
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @location in the line below:
    present(@page)
  end

  def show
    @location = Location.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @location in the line below:
    present(@page)
  end

protected

  def find_all_locations
    @locations = Location.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/locations")
  end

end
