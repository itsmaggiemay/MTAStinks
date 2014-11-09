#INDEX
get('/users') do
  @users = User.all
  erb :'users/index' 
end

#NEW 
get('/users/new') do
	erb :'/users/new'
end

#CREATE
post ('/users') do
	new_user = User.new(params[:id])
	if new_user.save
		redirect ("/users/#{new_user.id}")
	else
		redirect ("/users/new")
	end
end

#SHOW
get ('/users/:id') do
	@user = User.find(params[:id])
	erb :'users/show'
end


