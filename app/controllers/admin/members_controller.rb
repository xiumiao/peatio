module Admin
  class MembersController < BaseController
    load_and_authorize_resource

    def index
      type = params[:type]
      @search_field = params[:search_field]
      @search_term = params[:search_term]
      @members = Member.includes(:id_document).search(field: @search_field, term: @search_term).members(type).references(:id_document).page params[:page]
    end

    def new
      @identity = env['omniauth.identity'] || Identity.new
      @member = Member.new
    end

    def create
      @member = Member.new member_params
      @id_document = IdDocument.new id_document_params
      @fee = Fee.new fee_params
      @member.id_document = @id_document
      @member.fee = @fee
      @member.register_org = true
      if  @member.save
        redirect_to admin_members_path(:type=>0)
      else
        redirect_to :back
      end

    end

    def show
      @account_versions = AccountVersion.where(account_id: @member.account_ids).order(:id).reverse_order.page params[:page]
    end

    def toggle
      if params[:api]
        @member.api_disabled = !@member.api_disabled?
      else
        @member.disabled = !@member.disabled?
      end
      @member.save
    end

    def active
      @member.update_attribute(:activated, true)
      # 激活账户，如果是通过管理员后台注册的会员单位，目前需要创建密码重设
      @identity = Identity.find_by_email @member.email
      unless @identity
        identity = Identity.new({email:@member.email,password:'test111111',password_confirmation:'test111111'})
        identity.save

      end
      unless @member.authentications.find_by_uid @identity.uid
        @member.create_auth_for_identity(@identity)
      end
      token = Token.for_member(@member)
      token.update_attribute(:type,'Token::ResetPassword')
      TokenMailer.reset_password(@member.email, token).deliver
      @member.save
      redirect_to admin_member_path(@member)
    end

    private

    def member_params
      params.required(:member).permit(:email)
    end

    def id_document_params
      params.required(:member).required(:id_document).permit!
    end

    def fee_params
      params.required(:member).required(:fee).permit!
    end
  end
end
