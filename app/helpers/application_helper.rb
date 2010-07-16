# Methods added to this helper will be available to all templates in the application.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.
module ApplicationHelper
  include Refinery::ApplicationHelper # leave this line in to include all of Refinery's core helper methods.

  def sidebar_required?
    @menu_elements = []
    if @page.parent_id.present?
      @menu_elements = @page.parent.children.reject{|c| !c.in_menu?}
    end
    unless @page.children.blank?
     @menu_elements = @page.children.reject{|c| !c.in_menu?}
    end
    return !@menu_elements.empty?
  end
end
