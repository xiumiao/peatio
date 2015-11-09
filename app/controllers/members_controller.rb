class MembersController < ApplicationController
  before_filter :auth_member!
  before_filter :auth_no_initial!

  def index
    @members = Member.all.owner(current_user.id).page params[:page]
  end

  def edit
    @member = current_user
  end

  def update
    @member = current_user
    # 这里主要是更新选择会员单位，并同步一下费率
    if @member.id_document.update_attributes(member_params)
      redirect_to settings_path
    else
      render :edit
    end
  end

  private
  def member_params
    params.required(:member).require(:id_document).permit(:oraganization)
  end
end
