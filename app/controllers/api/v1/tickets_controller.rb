class Api::V1::TicketsController < ApplicationController
    before_action :authenticate_request!, except: :login
    before_action :set_ticket, only: [:show, :update, :destroy]
  
    # GET /api/v1/tickets
    def index
      @tickets = Ticket.all
      render json: @tickets.map { |ticket| ticket.new_attributes }
    end
  
    # GET /api/v1/tickets/1
    def show
      render json: @ticket.new_attributes
      
    end

    def search
      key = "%#{params[:key]}%"
      @posts = Post.where("name LIKE ?", key)
  end
  
    # POST /api/v1/tickets
    def create
      @ticket = Ticket.new(ticket_params)
  
      if @ticket.save
        render json: @ticket.new_attributes, status: :created
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/tickets/1
    def update
      if @ticket.update(ticket_params)
        render json: @ticket.new_attributes
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/tickets/1
    def destroy
      @ticket.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ticket
        # @api_v1_ticket = Api::V1::ticket.find(params[:id])
        @ticket = Ticket.find_by_id(params[:id])
        if @ticket.nil?
          render json: { error: "ticket not found" }, status: :not_found
        end
      end
  
    # Only allow a list of trusted parameters through.
    def ticket_params
      # params.require(:api_v1_ticket).permit(:name, :role_id)
      # {
      #   total_passenger: params[:total_passenger],
      #   user_id: params[:user_id],
      #   flight_id: params[:flight_id]
      # }
      params.permit(
        :total_passenger,
        :user_id,
        :flight_id
      )
    end
end
