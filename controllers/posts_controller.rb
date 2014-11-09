#INDEX (main page & lists of posts)
get '/posts' do 
	@posts = Post.all 
	erb :'/posts/index' 
end

#SHOW (finding each post and showing by itself)
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'/posts/show'
end

#NEW
get '/posts/new' do
 	@user = User.all
 	erb :'/posts/new'
end