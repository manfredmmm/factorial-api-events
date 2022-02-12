class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActionController::ParameterMissing, with: :invalid_params

  private

  def not_found(exception)
    render json: { errors: exception }, status: :not_found
  end
  
  def not_destroyed(exception)
    render json: { errors: exception }, status: :unprocessable_entity
  end

  def invalid_params(exception)
    render json: { errors: exception }, status: :bad_request
  end
end
