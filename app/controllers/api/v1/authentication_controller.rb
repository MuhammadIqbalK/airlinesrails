class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:authenticate_user]
    def authenticate_user
        user = User.find_by_email(params[:email])
        if user&.authenticate(params[:password])
          render json: payload(user)
        else
          render json: {
                   errors: ["Invalid Username/Password"]
                 },
                 status: :unauthorized
        end
      end
    
      private
    
      def payload(user)
        return nil unless user and user.id
        {
          auth_token: JsonWebToken.encode({ user_id: user.id }),
          user: {
            id: user.id,
            email: user.email
          }
        }
      end
    
      def user_params
        params.permit(:email, :password)
      end

end
