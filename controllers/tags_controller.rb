#INDEX
get '/tags' do
	@tags = Tag.all
	erb :'/tags/index'
end

#SHOW
get '/tags/:id' do
	@posts = Post.all
	@tag = Tag.find(params[:id])
	erb :'/tags/show'
end


#ADD POST TO Tag

put 'tags/:id/add_tag' do
	tag = Tag.find(params[:id])
	post = Post.find(params[:post_id])
	tag.posts << post
	redirect "/tags/#{tag.id}"
end

put '/tags/:id/remove_tag' do
	tag = Tag.find(params[:id])
	tag.posts.destroy(params[:post_id])
	redirect "tags/#{tag.id}"
end
