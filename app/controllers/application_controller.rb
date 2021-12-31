class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_current_user

  def access_denied(exception)
    redirect_to admin_root_path, alert: exception.message
  end

  private

  def set_current_user
    User.current = current_user
  end

end
