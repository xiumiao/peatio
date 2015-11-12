module Private
  class IpoApplicantsController < ApplicationController
    before_action :set_ipo_applicant, only: [:show, :edit, :update, :destroy]

    # GET /ipo_applicants
    # GET /ipo_applicants.json
    def index
      @ipo_applicants = IpoApplicant.all
    end

    # GET /ipo_applicants/1
    # GET /ipo_applicants/1.json
    def show
    end

    # GET /ipo_applicants/new
    def new
      @ipo_applicant = IpoApplicant.new
    end

    # GET /ipo_applicants/1/edit
    def edit
    end

    # POST /ipo_applicants
    # POST /ipo_applicants.json
    def create
      @ipo_applicant = IpoApplicant.new(ipo_applicant_params)

      respond_to do |format|
        if @ipo_applicant.save
          format.html { redirect_to @ipo_applicant, notice: 'Ipo applicant was successfully created.' }
          format.json { render action: 'show', status: :created, location: @ipo_applicant }
        else
          format.html { render action: 'new' }
          format.json { render json: @ipo_applicant.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /ipo_applicants/1
    # PATCH/PUT /ipo_applicants/1.json
    def update
      respond_to do |format|
        if @ipo_applicant.update(ipo_applicant_params)
          format.html { redirect_to @ipo_applicant, notice: 'Ipo applicant was successfully updated.' }
          format.json { render action: 'show', status: :ok, location: @ipo_applicant }
        else
          format.html { render action: 'edit' }
          format.json { render json: @ipo_applicant.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /ipo_applicants/1
    # DELETE /ipo_applicants/1.json
    def destroy
      @ipo_applicant.destroy
      respond_to do |format|
        format.html { redirect_to ipo_applicants_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ipo_applicant
        @ipo_applicant = IpoApplicant.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def ipo_applicant_params
        params.require(:ipo_applicant).permit(:production, :base_unit, :issue_price, :total_stock, :ipo_count, :top_limit, :start_time, :end_time, :state, :member_id, :audit_id, :audit_time)
      end
  end
end