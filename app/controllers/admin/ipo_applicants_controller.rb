module Admin
  class IpoApplicantsController < BaseController
    before_action :set_ipo_applicant, only: [:show, :edit, :update, :destroy, :end_applicant]

    # GET /ipo_applicants
    # GET /ipo_applicants.json
    def index
      @ipo_applicants = IpoApplicant.all.order('updated_at desc, audit_time desc').page(params[:page])
    end

    # GET /ipo_applicants/1
    # GET /ipo_applicants/1.json
    def show
      @ipos = @ipo_applicant.ipos
      if @ipos.sum(:amount) > 0
        @success_rate = (@ipo_applicant.total_stock.to_f/@ipos.sum(:amount)*100).round
      else
        @success_rate = 'N/A'
      end


    end

    # GET /ipo_applicants/1/edit
    def edit
    end


    # PATCH/PUT /ipo_applicants/1
    # PATCH/PUT /ipo_applicants/1.json
    def update
      if @ipo_applicant.may_accept? && @ipo_applicant.accept!(:accepted, current_user)
        flash[:notice] = '该IPO已审核通过'

      else
        flash[:alert] = '该IPO操作失败'
      end
      redirect_to :back
    end

    # 结束申购, 并抽签
    def end_applicant
      if @ipo_applicant.may_check?
        # array =
        # 申购总量
        all_amount = @ipo_applicant.ipos.sum(:amount)
        # 开放申购数量
        amount = @ipo_applicant.ipo_count
        # 所有申购该产品的会员Id,申购数量
        ids = @ipo_applicant.ipos.select([:id,:amount]).map{|ipo|[ipo.id,ipo.amount]}
        # 初始化数组,抽签
        array = Array.new(all_amount,0)
        init = 0
        ids.each do|id, count|
          array.fill(id,init,count)
          init += count

        end
        result = array.shuffle
        hash_result = Hash.new(0)
        result.slice(0...amount).each do |v|
          hash_result[v] +=1
        end

        hash_result.each do |key,value|
          ipo = Ipo.find(key)
          ipo.update_attribute('count',value)
          amount = ipo.amount
          @cny_account = ipo.member.cny
          @cny_account.ipo_unlock_funds(@ipo_applicant.issue_price*(amount-value),  reason: Account::IPO_UNLOCK, ref: ipo) unless amount == value
        end

        @ipo_applicant.check!
      else
        flash[:notice] = '抽签失败！'
      end

      redirect_to :back
    end

    # DELETE /ipo_applicants/1
    # DELETE /ipo_applicants/1.json
    def destroy
      if @ipo_applicant.may_reject? && @ipo_applicant.reject!(:rejected, current_user)
        flash[:notice] = '该IPO申请已被拒绝'
      else
        flash[:notice] = '该IPO不允许进行该操作'
      end
      redirect_to :back
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


  end
end