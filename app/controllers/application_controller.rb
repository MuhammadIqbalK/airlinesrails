class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  attr_reader :current_user

    # private
  
    def authenticate_request
      # unless user_id_in_token?
      #   render json: { errors: ["Not Authenticated"] }, status: :unauthorized
      #   return
      # end
      # binding.pry
    @current_user = JsonWebToken::AuthorizeApiRequest(request.headers)
    # return render json: @current_user
    render json: { errors: ["Not Authenticated"] }, status: 401 unless @current_user
       
      # @current_user = User.find(auth_token[:user_id])
      # binding.pry
    # rescue JWT::VerificationError, JWT::DecodeError
      # render json: { errors: ["Not Authenticated"] }, status: :unauthorized
    end
  
    # private
  
    # def http_token
    #   @http_token ||=
    #     if request.headers["Authorization"].present?
    #       request.headers["Authorization"].split(" ").last
    #     end
    # end
  
    # def auth_token
    #   @auth_token ||= JsonWebToken.decode(http_token)
    #   # binding.pry
    # end
  
    # def user_id_in_token?
    #   # binding.pry
    #   http_token && auth_token && auth_token[:user_id].to_i
    # end
end
