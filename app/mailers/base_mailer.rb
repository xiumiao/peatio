class BaseMailer < ActionMailer::Base
  include AMQPQueue::Mailer

  layout 'mailers/application'
  add_template_helper MailerHelper

  default from: ENV['SYSTEM_MAIL_FROM'],
          reply_to: ENV['SUPPORT_MAIL']
end
# app/mailers/application_mailer.rb
# class BaseMailer < ActionMailer::Base
#   default from: "wiki@jsdttec.com"
#   layout 'mailers/application'
# end