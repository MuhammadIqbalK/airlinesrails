class Api::V1::FlightsController < ApplicationController
    before_action :authenticate_request!, except: :login
    before_action :set_flight, only: [:show, :update, :destroy]
  
    # GET /api/v1/flights
    def index
      @flights = Flight.all
      render json: @flights.map { |flight| flight.new_attributes }
    end
  
    # GET /api/v1/flights/1
    def show
      render json: @flight.new_attributes
      
    end
  
    # POST /api/v1/flights
    def create
      @flight = Flight.new(flight_params)
  
      if @flight.save
        render json: @flight.new_attributes, status: :created, location: @flight
      else
        render json: @flight.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/flights/1
    def update
      if @flight.update(flight_params)
        render json: @flight.new_attributes
      else
        render json: @flight.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/flights/1
    def destroy
      @flight.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_flight
        # @api_v1_flight = Api::V1::flight.find(params[:id])
        @flight = Flight.find_by_id(params[:id])
        if @flight.nil?
          render json: { error: "flight not found" }, status: :not_found
        end
      end
  
    # Only allow a list of trusted parameters through.
    def api_v1_flight_params
      # params.require(:api_v1_flight).permit(:name, :role_id)
      {
        departure_airport: params[:departure_airport],
        arrival_airport: params[:arrival_airport],
        departure_time: params[:departure_time],
        arrival_time: params[:arrival_time],
        price: params[:price],
        airline_id: params[:airline_id],
        created_by: params[:created_by]
      }
    end

end
