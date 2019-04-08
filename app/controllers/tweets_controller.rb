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

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'tweets/show_tweets'
    else
      redirect '/login'
    end
  end

  post '/tweets/new' do
    if logged_in? && !params[:content].empty?
      @user = current_user
      @user.tweets << Tweet.create(:content => params[:content])
      redirect "/tweets"
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'tweets/edit_tweet'
    else
      redirect '/login'
    end
  end

  patch '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      @tweet.update(params[:content])
      redirect"/tweets/tweets"
    else
      redirect '/login'
    end
  end

  delete '/tweets/:id' do
    if logged_in? && @user==current_user
      @tweet = Tweet.find(params[:id])
      @tweet.delete
      redirect '/tweets'
    else
      redirect '/login'
    end

  end


end
