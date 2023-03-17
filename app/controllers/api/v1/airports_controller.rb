class Api::V1::AirportsController < ApplicationController
    # before_action :authenticate_request!, except: :login
    before_action :set_airport, only: [:show, :update, :destroy]
  
    # GET /api/v1/airports
    def index
      @airports = Airport.all
      render json: @airports.map { |airport| airport.new_attributes }
    end
  
    # GET /api/v1/airports/1
    def show
      render json: @airport.new_attributes
      
    end
  
    # POST /api/v1/airports
    def create
      @airport = Airport.new(airport_params)
  
      if @airport.save
        render json: @airport.new_attributes, status: :created
      else
        render json: @airport.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/airports/1
    def update
      if @airport.update(airport_params)
        render json: @airport.new_attributes
      else
        render json: @airport.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/airports/1
    def destroy
      @airport.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_airport
        # @api_v1_airport = Api::V1::airport.find(params[:id])
        @airport = Airport.find_by_id(params[:id])
        if @airport.nil?
          render json: { error: "airport not found" }, status: :not_found
        end
      end
  
    # Only allow a list of trusted parameters through.
    def airport_params
      # params.require(:api_v1_airport).permit(:name, :role_id)
      params.permit(
        :name,
        :city
      )
    end
end
