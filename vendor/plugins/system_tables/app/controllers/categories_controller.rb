class CategoriesController < ApplicationController

  before_filter :find_all_categories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @category in the line below:
    present(@page)
  end

  def show
    @category = Category.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @category in the line below:
    present(@page)
  end

protected

  def find_all_categories
    @categories = Category.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/categories")
  end

end
