class WelcomeController < ApplicationController
  layout 'landing'

  def index
    @ipo_applicants = IpoApplicant.approved.order('end_time, audit_time desc').page(params[:page])
  end
end
