module Private
  class IposController < ApplicationController
    before_action :set_ipo, only: [:show, :edit, :update, :destroy]

    # GET /ipos
    # GET /ipos.json
    def index
      @ipos = Ipo.all
    end

    # GET /ipos/1
    # GET /ipos/1.json
    def show
    end

    # GET /ipos/new
    def new
      @ipo = Ipo.new
    end

    # GET /ipos/1/edit
    def edit
    end

    # POST /ipos
    # POST /ipos.json
    def create
      @ipo = Ipo.new(ipo_params)

      respond_to do |format|
        if @ipo.save
          format.html { redirect_to @ipo, notice: 'Ipo was successfully created.' }
          format.json { render action: 'show', status: :created, location: @ipo }
        else
          format.html { render action: 'new' }
          format.json { render json: @ipo.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /ipos/1
    # PATCH/PUT /ipos/1.json
    def update
      respond_to do |format|
        if @ipo.update(ipo_params)
          format.html { redirect_to @ipo, notice: 'Ipo was successfully updated.' }
          format.json { render action: 'show', status: :ok, location: @ipo }
        else
          format.html { render action: 'edit' }
          format.json { render json: @ipo.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /ipos/1
    # DELETE /ipos/1.json
    def destroy
      @ipo.destroy
      respond_to do |format|
        format.html { redirect_to ipos_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ipo
        @ipo = Ipo.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def ipo_params
        params.require(:ipo).permit(:pre_ipo_id, :member_id, :amount, :count, :state)
      end
  end
end