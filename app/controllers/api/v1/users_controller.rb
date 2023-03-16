class Api::V1::UsersController < ApplicationController

  # before_action :set_api_v1_user, only: %i[ show update destroy ]
  before_action :authenticate_request!, except: :login
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users.map { |user| user.new_attributes }
  end

  # GET /api/v1/users/1
  def show
    render json: @user.new_attributes
    
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.new_attributes, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user.new_attributes
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
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
  def user_params
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
end
