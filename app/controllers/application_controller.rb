class ApplicationController < ActionController::Base
  layout 'application'
  skip_before_action :verify_authenticity_token
  require 'json_web_token'

  protected
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_user!
    invalid_authentication unless @current_user
  end

  def invalid_authentication
    render json: {error: '401 - Unauthorized; send POST request to /users with email and password to receive access token'}
  end

  private
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end
