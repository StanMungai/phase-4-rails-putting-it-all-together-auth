class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  before_action :authorize 

  private

  def authorize
    @user = User.find_by(id: session[:user_id])
    render json: { errors: ["Unauthorized"]}, status: :unauthorized unless @user
  end

  def render_invalid_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
