#INDEX (main page & lists of posts)
get '/posts' do 
	@posts = Post.order(created_at: :desc)
	@users = User.all
	erb :'/posts/index' 
end

#NEW
get '/posts/new' do
 	@users = User.all
 	erb :'/posts/new'
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

#SHOW (finding each post and showing by itself)
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'/posts/show'
end


#EDIT
get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	@users = User.all
	erb :'/posts/edit'
end


# UPDATE
post '/posts/:id' do
	post = Post.find(params[:id])
	if post.update(params[:post])
		redirect("/posts/#{post.id}")
	else
		redirect("/posts/#{post.id}/edit")
	end
end


#DESTROY
delete '/posts/:id' do
	post = Post.find(params[:id])
	if post.destroy 
		redirect ("/posts")
	else
		redirect ("/posts/#{post.id}")
	end
end
