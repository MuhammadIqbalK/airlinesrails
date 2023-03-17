class Api::V1::UsersController < ApplicationController
  # skip_before_action :authenticate_request!, only: [:create, :login]
  # before_action :set_api_v1_user, only: %i[ show update destroy ]
  skip_before_action :authenticate_request, only: [:login, :create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    # if @current_user.try(:admin?) 
    #   render json: { message: 'customer are not allowed to get all users!!' }, status: 403
    #   return
    # end
    @users = User.all
    render json: @users.map(&:new_attributes), status: :ok
    # render json: @users.map { |user| user.new_attributes }
  end

  # POST /api/v1/users
  def create
    # user_params.role = 2
    @user = User.new(user_params)

    unless @user.save
      render json: @user.errors, status: :unprocessable_entity
      return
    end
      render json: @user.new_attributes, status: :created
  end

  # GET /api/v1/users/1
  def show
    render json: @user.new_attributes
    
  end

  def search
    #key = "%#{params}%"
    render json: User.where("name ILIKE ?", (params[:q]))

  end

  # PATCH/PUT /api/v1/users/1
  def update
    unless @user.update(user_params)
      render json: @user.errors, status: :unprocessable_entity
      return
    end
    render json: @user.new_attributes, status: :ok
  end
  #   if @user.update(user_params)
  #     render json: @user.new_attributes
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/users/1
  def destroy
    if @user.id != current_user.id && !current_user.admin?
      render json: { message: 'action not allowed!!' }, status: :forbidden
      return
    end
    unless @user.destroy
      render json: @user.errors, status: :unprocessable_entity
      return
    end
    render json: @user.new_attributes, status: :ok
  end
  #   @user.destroy
  # end

  def admin
    @admins = User.admin
    render json: @admins.map(&:new_attributes), status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    # @api_v1_user = Api::V1::User.find(params[:id])
    @user = User.find_by_id(params[:id])
    render json: { error: "User not found" }, status: :not_found if @user.nil?
    
  end

  # Only allow a list of trusted parameters through.
  def user_params
    # params.require(:user).permit(
    params.permit(
      :name, 
      :password,
      :email,
      :contact,
      :role,
      :gender
    )
    # {
    #   name: params[:name],
    #   password: params[:password],
    #   email: params[:email],
    #   contact: params[:contact],
    #   role: params[:role],
    #   gender: params[:gender]
    # }
  end

  # def self.display_all(params)
  
  # end
end
