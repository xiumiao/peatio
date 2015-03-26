class IdentitiesController < ApplicationController
  before_filter :auth_anybody!, only: :new

  def new
    @identity = env['omniauth.identity'] || Identity.new
  end

  def edit
    @identity = current_user.identity
  end

  def update
    @identity = current_user.identity('email')

    unless @identity.authenticate(params[:identity][:old_password])
      redirect_to edit_identity_path, alert: t('.auth-error') and return
    end

    if params[:identity][:old_password] == params[:identity][:password]
      redirect_to edit_identity_path, alert: t('.auth-same') and return
    end

    current_user.update_password! identity_params
    current_user.send_password_changed_notification
    clear_all_sessions current_user.id
    reset_session
    redirect_to signin_path, notice: t('.notice')
  rescue
    Rails.logger.error $!
    Rails.logger.error $!.backtrace[0,10].join("\n")
    render :edit
  end

  private

  def identity_params
    params.required(:identity).permit(:password, :password_confirmation)
  end

end
