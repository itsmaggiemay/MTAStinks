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
