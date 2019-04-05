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

  post 'tweets' do
    @tweet = Tweet.create(:content => params["Content"])
    @tweet.save
    redirect "/tweets/show_tweets"
  end


end
