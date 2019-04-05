class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :"tweets/tweets"
    else
      redirect '/login'
    end
  end 

  get '/tweets/new' do
    erb :'tweets/new'
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    erb :'tweet/show_tweets'
  end

end
