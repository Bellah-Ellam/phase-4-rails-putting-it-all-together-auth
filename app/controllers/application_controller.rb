class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authenticate_user

  private

  def authenticate_user
    unless logged_in?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
    nil
  end

  def logged_in?
    !!current_user
  end
end
