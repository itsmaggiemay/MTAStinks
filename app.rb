require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'better_errors'

#=============#
	 #MODELS#
#=============#

require_relative 'models/tag.rb'
require_relative 'models/post.rb'
require_relative 'models/user.rb'

#=============#
 #CONTROLLERS#
#=============#

require_relative 'controllers/home_controller.rb'
require_relative 'controllers/posts_controller.rb'
require_relative 'controllers/tags_controller.rb'
require_relative 'controllers/users_controller.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'tunr_db',
	host: 'localhost'
})

after { ActiveRecord::Base.connection.close }