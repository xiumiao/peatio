source 'https://ruby.taobao.org'

gem 'rails', '~> 4.0.12'
gem 'rails-i18n'

gem 'mysql2'
# 守护进程 lib/daemons
gem 'daemons-rails'
# 内存数据库，与memcached类似
gem 'redis-rails'

# 验证码
gem 'rotp'
gem 'json'
gem 'jbuilder'
# 加密
gem 'bcrypt-ruby', '~> 3.1.2'

# OAuth 2 provider
gem 'doorkeeper', '~> 1.4.1'
gem 'omniauth', '~> 1.2.1'
gem 'omniauth-identity', '~> 1.1.1'
gem 'omniauth-weibo-oauth2', '~> 0.4.0'

# Figaro was written to make it easy to securely configure Rails applications.
gem 'figaro'
# Hashie is a collection of classes and mixins that make hashes more powerful.
gem 'hashie'

# Ruby state machines
gem 'aasm', '~> 3.4.0'
# message server protocal
gem 'amqp', '~> 1.3.0'
# RabbitMQ ruby client
gem 'bunny', '~> 1.2.1'
# 权限管理
gem 'cancancan'
# 枚举
gem 'enumerize'
# 页面数据排序
gem 'datagrid'
# 还没看明白干嘛用的， https://github.com/mbleigh/acts-as-taggable-on
gem 'acts-as-taggable-on'
# 和WillPaginate类似的Gem
gem 'kaminari'
# 对ActiveRecord 做物理删除或者虚拟删除（置一个删除时间表示该消息的状态）
gem 'paranoid2'
#
gem 'active_hash'
gem 'http_accept_language'
gem "globalize", "~> 4.0.0"
# 追踪Model变化，用来做审计工作
gem 'paper_trail', '~> 3.0.1'
gem 'rails-observers'
gem 'country_select', '~> 2.1.0'

# 简单来讲就是把服务器端的变量在浏览器端可用
gem 'gon', '~> 5.2.0'
#  http://pusher.com 封装消息
gem 'pusher'
gem 'eventmachine', '~> 1.0.4'
gem 'em-websocket', '~> 0.5.1'

# 简单的表单生成工具
gem 'simple_form', '~> 3.1.0'
# rails slim模板
gem 'slim-rails'
# SASS支持
gem 'sass-rails'
# coffeesciprt 支持
gem 'coffee-rails'
# javascrip引擎之一
gem 'uglifier'
# jquery支持
gem "jquery-rails"
# angularjs支持
gem "angularjs-rails"
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'bootstrap-wysihtml5-rails'
gem 'font-awesome-sass'
gem 'bourbon'
gem 'momentjs-rails'
gem 'eco'
gem 'browser', '~> 0.8.0'
gem 'rbtree'
gem 'liability-proof', '0.0.9'
gem 'whenever', '~> 0.9.2'
gem 'grape', '~> 0.7.0'
gem 'grape-entity', '~> 0.4.2'
gem 'grape-swagger', '~> 0.7.2'
gem 'rack-attack', '~> 3.0.0'
gem 'easy_table'
gem 'phonelib', '~> 0.3.5'
gem 'twilio-ruby', '~> 3.11'
gem 'unread', github: 'peatio/unread'
gem 'carrierwave', '~> 0.10.0'
gem 'simple_captcha2', require: 'simple_captcha'
gem 'rest-client', '~> 1.6.8'
gem 'capistrano', '3.4.0'
# peatio api gem 包
gem 'peatio_client',github: 'peatio/peatio-client-ruby'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker', '~> 1.4.3'
  gem 'mina'
  gem 'mina-slack', github: 'peatio/mina-slack'
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'pry-remote'
  # gem 'pry-rails'
  gem 'quiet_assets'
  gem 'mails_viewer'
  gem 'timecop'
  gem 'dotenv-rails'
  gem 'rspec-rails'
  # gem 'byebug'
end

group :test do
  gem 'database_cleaner'
  gem 'mocha', :require => false
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'poltergeist'

  # rspec-rails rely on test-unit if rails version less then 4.1.0
  # but test-unit has been removed from ruby core since 2.2.0
  gem 'test-unit'
  # 让rails4以上的版本支持在production模式下访问静态资源
  # config.serve_static_assets = true
  # config.action_dispatch.x_sendfile_header = nil
  gem 'rails_serve_static_assets'
  gem 'rails_stdout_logging'
end
