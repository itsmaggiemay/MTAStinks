#INDEX (main page & lists of posts)
get '/posts' do #the location of the page
	erb :'posts/index' #where to find the code
end