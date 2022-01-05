class ApplicationController < ActionController::Base
  before_action :set_current_user, if: :user_signed_in?

  def access_denied(exception)
    redirect_to admin_root_path, alert: exception.message
  end

  private

  def set_current_user
    User.current = current_user
  end

end
