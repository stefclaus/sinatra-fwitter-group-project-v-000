class TweetsController < ApplicationController

  get '/tweets' do
    erb :"tweets/tweets"
  end

#  get '/tweets/new' do
#    if logged_in?
#      erb :'tweets/new'
#    else
#      redirect '/login'
#    end
#  end

#  get '/tweets/:id' do
#    @tweet = Tweet.find(params[:id])
#    erb :'tweets/show_tweets'
#  end

#  post 'tweets' do
#    @tweet = Tweet.create(:content => params["Content"])
#    @tweet.save
#    redirect "/tweets/show_tweets"
#  end


end
