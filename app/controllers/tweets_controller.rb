class TweetsController < ApplicationController

  get '/tweets' do
      if logged_in?
          @user = current_user
          erb :"tweets/tweets"
      else
          redirect "/login"
      end
    end

    get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

  #get '/tweets/:id' do
  #  @tweet = Tweet.find(params[:id])
  #  erb :'tweets/show_tweets'
  #end

  post '/tweets/new' do
    if logged_in? && !params[:content].empty?
      @user = current_user
      @user.tweets << Tweet.create(:content => params[:content])
      redirect "/tweets"
    end
  end


end
