require 'active_record'

ActiveRecord::Base.establish_connection({
	database: 'mtastinks_db',
	adapter: 'postgresql'
})

#models
require_relative '../models/post.rb'
require_relative '../models/user.rb'
require_relative '../models/tag.rb'


User.destroy_all
Post.destroy_all
Tag.destroy_all

#================#
   #USER  DATA
#================#

user_usernames = ['taiwaneseracket', 'poppystore', 'hardtofindpie', 'rosyone', 'deepfive', 'statuskuo', 'snowballtanzanian']
user_names = ['Meep Beep', 'Hello Tomorrow', 'Lauren Nidhi', 'Margaret E', 'Cesar H', 'Johanna Santi']
user_city_boroughs =['Astoria, Queens', 'Midtown, Manhattan', 'Williamsburg, Brooklyn', 'Park Slope, Brooklyn', 'Bayside, Queens', 'Edenwald, Bronx', 'Melrose, Bronx', 'DUMBO, Brooklyn', 'Gowanus, Brooklyn', 'Cobble Hill, Brooklyn', 'Red Hook, Brooklyn', 'Hugenot, Staten Island', 'New Brighton, Staten Island', 'Oak Wood, Staten Island', 'Jamaica Hills, Queens', 'Ozone Park, Queens', 'Little Neck, Queens', 'Lower East Side, Manhattan', 'Greenwich Village, Manhattan', 'Yorkville, Manhattan']
user_img_urls = ["http://lorempixel.com/300/300/cats/",
        				"http://lorempixel.com/300/300/animals/",
           			"http://lorempixel.com/300/300/food/"]

    5.times do
    	User.create(
    		username: user_usernames.sample,
    		name: user_names.sample,
    		city_borough: user_city_boroughs.sample,
    		img_url: user_img_urls.sample
    	)
    end
#================#
     # TAG #
#================#

tag_names = ['F train', 'Q Train', 'Electrical', 'Stalled', 'Powergrid']

	5.times do
		Tag.create(
			name: tag_names.sample 
		)
	end

	# tag_values.each do |x|
	# 	Tag.create( value: x)
	# end



#================#
   #POST  DATA
#================#

post_comments = ['Smooth Ride Today', 'Electrical Problem', 'This train smells and stalled', 'Stalled train', 'Wire Issues trains diverted', 'Someone fell on the tracks']

# post_traintitles = ['F Train', 'N Train', 'R Train', 'A Train', '6 Train']

5.times do
post = Post.new({
		comment: post_comments.sample,
		user: User.all.sample
		# traintitle: post_traintitles.sample
		})
	post.save
	post.tags = Tag.all.sample(3)
end