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
      @member.save
      redirect_to admin_member_path(@member)
    end

  end
end
