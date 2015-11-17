module Private
  class IpoApplicantsController < ApplicationController
    before_action :set_ipo_applicant, only: [:show, :edit, :update, :destroy, :subscribe]
    before_action :auth_member!, :auth_employer!,:auth_owner!, only:[:index,:show, :edit, :update]
    before_action :auth_member!, :auth_employer!, only:[:new]
    before_action :login?, [:subscribe]

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

    # 申购
    def subscribe
      @cny_account = current_user.cny
      if request.method.downcase == 'get'
        unless @ipo_applicant && @ipo_applicant.approved?
          flash[:notice] = '无法申购'
          redirect_to settings_path
        end
      elsif request.method.downcase == 'post'
        # 会员单位不能申购自己的IPO
        # 判断是否已申购
        # 判断余额
        # 判断申购上限
        # 锁定金额：account
        # 添加账户变动明细
        # 分配ipo number
        amount = (params[:amount] || 0).to_d
        unless amount > 0
          flash[:notice] = '申购数量不对'
          redirect_to :back && return
        end

        if @ipo_applicant.member == current_user
          flash[:notice] = '不能申购自己的IPO'
          redirect_to :back && return
        end
        if @ipo_applicant.has_subscribe? current_user
          flash[:notice] = '您已申购了该IPO，不能重复申购'
          redirect_to :back && return
        end
        if @cny_account.balance < @ipo_applicant.issue_price*amount
          flash[:notice] = '您账户的余额不足'
          redirect_to :back && return
        end
        if amount > @ipo_applicant.top_limit
          flash[:notice] = '不能超过该IPO申购上限'
          redirect_to :back && return
        end
        ipo = Ipo.new
        ipo.member = current_user
        ipo.amount = amount
        @ipo_applicant.ipos  << ipo
        @ipo_applicant.transaction do
          @cny_account.ipo_lock_funds(@ipo_applicant.issue_price*amount, fee: 0.to_d, reason: Account::IPO_LOCK, ref: @ipo)
          if @ipo_applicant.save
            redirect_to :back
          end
        end

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

      def login?
        unless current_user
          flash[:alert] = '您需要登录后才能申请！'
          redirect_to signin_path
        end
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