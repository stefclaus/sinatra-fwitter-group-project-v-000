class TweetsController < ApplicationController

  get '/tweets' do
   if logged_in?
     @tweets = Tweet.all
     erb :'tweets/tweets'
   else
     redirect to '/login'
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

  post '/tweets' do
    if logged_in?
      else
        redirect "/login"
      end
      if !params[:content].empty?
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
      if !params[:content].empty?
        @tweet.update(content: params[:content])
        redirect "/tweets/#{@tweet.id}"
      else
        redirect "/tweets/#{@tweet.id}/edit"
      end
    else
      redirect '/login'
    end #ends  first if
  end #ends patch

  delete "/tweets/:id" do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      if @tweet.user == current_user
        @tweet.delete
        redirect "/tweets"
      else
        redirect "/tweets"
      end
    else
      redirect "/login"
    end
  end




end
