class UsersController < ApplicationController

  get '/signup' do
    erb :"users/create_user"
  end

  post "/signup" do
    user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
    if params[:email] == "" || params[:username] == "" || params[:password] == ""
      redirect '/signup'
    elsif !!logged_in?
      redirect '/login'
    else
      user.save
      redirect '/tweets'
    end
	end



end
