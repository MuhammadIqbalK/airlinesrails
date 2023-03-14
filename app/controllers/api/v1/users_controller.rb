class Api::V1::UsersController < ApplicationController

# before_action :set_api_v1_user, only: %i[ show update destroy ]
before_action :authenticate_request!, except: :login
before_action :set_user, only: [:show, :update, :destroy]

# GET /api/v1/users
# GET /api/v1/users.json
def index
  # @api_v1_users = Api::V1::User.all
  @users = User.all
  render json: @users.map { |user| user.new_attributes }
end

# GET /api/v1/users/1
# GET /api/v1/users/1.json
def show
  render json: @user.new_attributes
  
end

# POST /api/v1/users
# POST /api/v1/users.json
def create
  @user = User.new(user_params)

  if @user.save
    render json: @user.new_attributes, status: :created, location: @user
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /api/v1/users/1
# PATCH/PUT /api/v1/users/1.json
def update
  if @user.update(user_params)
    render json: @user.new_attributes
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# DELETE /api/v1/users/1
# DELETE /api/v1/users/1.json
def destroy
  @user.destroy
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # @api_v1_user = Api::V1::User.find(params[:id])
    @user = User.find_by_id(params[:id])
    if @user.nil?
      render json: { error: "User not found" }, status: :not_found
    end
  end

  # Only allow a list of trusted parameters through.
  def api_v1_user_params
    # params.require(:api_v1_user).permit(:name, :role_id)
    {
      name: params[:name],
      password: params[:password],
      email: params[:email],
      # specialization: params[:specialization],
      contact: params[:contact],
      role: params[:role],
      # department_id: params[:department_id]
    }
  end
end
