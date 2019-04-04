class UsersController < ApplicationController

  get '/signup' do
    erb :"users/create_user"
  end

  post "/signup" do
    if params[:email] == "" || params[:username] == "" || params[:password] == ""
      redirect '/index'
      else
        User.new(:email => params[:email], :username => params[:username], :password => params[:password])
        redirect '/tweets'
    end
	end



end
