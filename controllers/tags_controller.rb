#INDEX
get '/tags' do
	@tags = Tag.all
	erb :'/tags/index'
end

# NEW
get('/tags/new') do
  erb :'tags/new' 
end

# CREATE
post('/tags') do
  new_tag = Tag.new(params[:tag])
  if new_tag.save
    redirect("/tags/#{new_tag.id}") 
  else
    redirect("/tags/new")
  end
end

#SHOW
get '/tags/:id' do
	@posts = Post.all
	@tag = Tag.find(params[:id])
	erb :'/tags/show'
end


# EDIT
get('/tags/:id/edit') do
  @tag = Tag.find(params[:id])
  erb :'/tags/edit' 
end

# UPDATE
put('/tags/:id') do
  tag = Tag.find(params[:id])
  if tag.update(params[:tag])
    redirect("/tags/#{tag.id}")
  else 
    redirect("/tags/#{tag.id}/edit")
  end
end

# DESTROY
delete('/tags/:id') do
  tag = Tag.find(params[:id]) 
  if tag.destroy
    redirect("/tags")
  else
    redirect("/tags/#{tag.id}")
  end
end


# ADD POST TO TAG
put('/tags/:id/add_post') do
  tag = Tag.find(params[:id])
  post = Post.find(params[:post_id])
  tag.posts << post
  redirect("/tags/#{tag.id}")
end

# REMOVE POST FROM TAG
put('/tags/:id/remove_post') do
  tag = Tag.find(params[:id])
  post = Post.find(params[:post_id])
  tag.posts.destroy(post)
  redirect("/tags/#{tag.id}")
end