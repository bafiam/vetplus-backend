class ApplicationController < ActionController::API
  before_action :authorized, :verify?

  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def encode_token(payload, exp = 2.hours.from_now)
  
    payload[:exp] = exp.to_i

    JWT.encode(payload, HMAC_SECRET)
    
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header.present? && auth_header.split(' ')[1] != nil
      @token = auth_header.split(' ')[1]
      decoded = JWT.decode(@token, HMAC_SECRET, true, algorithm: 'HS256')
      HashWithIndifferentAccess.new decoded
    end
  end

  def authorized
    @user_id = decoded_token[:user_id][0]['user_id']
    @current_user = User.find(@user_id)
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  rescue JWT::DecodeError => e
    Blacklist.create(token: @token)
    render json: { errors: e.message, alert: 'token blacklisted' }, status: :unauthorized
  end

  def verify?
    if Blacklist.where(token:@token).exists?
      @user_id = 0
      @current_user = nil
      render json: { errors:'token already blacklisted, Please log in again' }, status: :unauthorized
    end
  end
end
