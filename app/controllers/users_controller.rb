class UsersController < ApplicationController

  get '/signup' do
    erb :"users/create_user"
  end

  post "/signup" do
  	user = User.new(:username => params[:username], :password => params[:password])

  	if user.save
    	redirect "/tweets"
  	else
    	redirect "/login"
  	end
	end

end
