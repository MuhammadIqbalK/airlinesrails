class Api::V1::AirlinesController < ApplicationController
    before_action :authenticate_request!, except: :login
    before_action :set_airline, only: [:show, :update, :destroy]
  
    # GET /api/v1/airlines
    def index
      @airlines = Airline.all
      render json: @airlines.map { |airline| airline.new_attributes }
    end
  
    # GET /api/v1/airlines/1
    def show
      render json: @airline.new_attributes
      
    end
  
    # POST /api/v1/airlines
    def create
      @airline = Airline.new(airline_params)
  
      if @airline.save
        render json: @airline.new_attributes, status: :created, location: @airline
      else
        render json: @airline.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/airlines/1
    def update
      if @airline.update(airline_params)
        render json: @airline.new_attributes
      else
        render json: @airline.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/airlines/1
    def destroy
      @airline.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_airline
        # @api_v1_airline = Api::V1::airline.find(params[:id])
        @airline = Airline.find_by_id(params[:id])
        if @airline.nil?
          render json: { error: "airline not found" }, status: :not_found
        end
      end
  
    # Only allow a list of trusted parameters through.
    def api_v1_airline_params
      # params.require(:api_v1_airline).permit(:name, :role_id)
      {
        name: params[:name],
        code: params[:code]
      }
    end

end
