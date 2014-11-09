#INDEX (main page & lists of posts)
get '/posts' do 
	@posts = Post.order(created_at: :desc)
	erb :'/posts/index' 
end

#NEW
get '/posts/new' do
 	@users = User.all
 	erb :'/posts/new'
end

#SHOW (finding each post and showing by itself)
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'/posts/show'
end


#CREATE
post '/posts' do
	post = Post.new(params[:post])
	if post.save
		redirect("/posts/#{post.id}")
	else
		redirect("/posts/new")
	end
end

# #EDIT
# get '/posts/:id/edit' do
# 	@post = Post.find(params[:id])
# 	@users = 