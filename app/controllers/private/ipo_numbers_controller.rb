module Private
  class IpoNumbersController < ApplicationController
    before_action :set_ipo_number, only: [:show, :edit, :update, :destroy]

    # GET /ipo_numbers
    # GET /ipo_numbers.json
    def index
      @ipo_numbers = IpoNumber.all
    end

    # GET /ipo_numbers/1
    # GET /ipo_numbers/1.json
    def show
    end

    # GET /ipo_numbers/new
    def new
      @ipo_number = IpoNumber.new
    end

    # GET /ipo_numbers/1/edit
    def edit
    end

    # POST /ipo_numbers
    # POST /ipo_numbers.json
    def create
      @ipo_number = IpoNumber.new(ipo_number_params)

      respond_to do |format|
        if @ipo_number.save
          format.html { redirect_to @ipo_number, notice: 'Ipo number was successfully created.' }
          format.json { render action: 'show', status: :created, location: @ipo_number }
        else
          format.html { render action: 'new' }
          format.json { render json: @ipo_number.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /ipo_numbers/1
    # PATCH/PUT /ipo_numbers/1.json
    def update
      respond_to do |format|
        if @ipo_number.update(ipo_number_params)
          format.html { redirect_to @ipo_number, notice: 'Ipo number was successfully updated.' }
          format.json { render action: 'show', status: :ok, location: @ipo_number }
        else
          format.html { render action: 'edit' }
          format.json { render json: @ipo_number.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /ipo_numbers/1
    # DELETE /ipo_numbers/1.json
    def destroy
      @ipo_number.destroy
      respond_to do |format|
        format.html { redirect_to ipo_numbers_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ipo_number
        @ipo_number = IpoNumber.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def ipo_number_params
        params.require(:ipo_number).permit(:ipo_id)
      end
  end
end

