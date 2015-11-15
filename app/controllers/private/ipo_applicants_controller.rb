module Private
  class IpoApplicantsController < ApplicationController
    before_action :set_ipo_applicant, only: [:show, :edit, :update, :destroy]
    before_action :auth_member!, :auth_employer!, only:[:new]
    before_action :auth_owner!, only:[:show, :edit, :update]

    # GET /ipo_applicants
    # GET /ipo_applicants.json
    def index
      @ipo_applicants = IpoApplicant.owner(current_user).page(params[:page])
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
      @ipo_applicant.member = current_user
      respond_to do |format|
        if @ipo_applicant.submit!
          format.html { redirect_to @ipo_applicant, notice: '您的IPO申请已受理，请您耐心等待，网站人员会与您联系！' }
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
      unless @ipo_applicant.may_reject?
        flash[:notice] = '没有权限操作'
        return
      end
      @ipo_applicant.reject!
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
        params.require(:ipo_applicant).permit(:production, :base_unit, :issue_price, :total_stock,  :top_limit, :start_time, :end_time)
      end

      # only owner can edit ipo applicants
      def auth_owner!
        unless current_user.ipo_applicants.include? @ipo_applicant
          flash[:alert] = '您没有权限编辑查看！'
          redirect_to settings_path
          return false
        end

      end
  end
end