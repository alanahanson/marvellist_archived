get '/' do
  @series = Series.all
  erb :index
end

get '/login' do
  erb :login, layout: false
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
  else
    @failed_login = true
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

post '/subscribe/:id' do
  current_user.series << Series.find(params[:id])
  redirect '/'
end
