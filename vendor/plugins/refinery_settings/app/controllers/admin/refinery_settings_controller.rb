class Admin::RefinerySettingsController < Admin::BaseController

  crudify :refinery_setting, :title_attribute => :title, :order => "name ASC", :searchable => false

  before_filter :sanitise_params, :only => [:create, :update]
  after_filter :fire_setting_callback, :only => [:update]

  def edit
    @refinery_setting = RefinerySetting.find(params[:id])

    render :layout => false if request.xhr?
  end

  def find_all_refinery_settings
    @refinery_settings = RefinerySetting.find :all,
                                              :order => "name ASC",
                                              :conditions => current_user.has_role?(:superuser) ? nil : ["restricted <> ?", true]
  end

  def paginate_all_refinery_settings
    @refinery_settings = RefinerySetting.paginate :page => params[:page],
                                                  :order => "name ASC",
                                                  :conditions => current_user.has_role?(:superuser) ? nil : ["restricted <> ?", true]
  end

private
  # this fires before an update or create to remove any attempts to pass sensitive arguments.
  def sanitise_params
    params.delete(:callback_proc_as_string)
    params.delete(:scoping)
  end

  def fire_setting_callback
    begin
      @refinery_setting.callback_proc.call
    rescue
      logger.warn('Could not fire callback proc. Details:')
      logger.warn(@refinery_setting.inspect)
      logger.warn($!.message)
      logger.warn($!.backtrace)
    end unless @refinery_setting.callback_proc.nil?
  end

end
