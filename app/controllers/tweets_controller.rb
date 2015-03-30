class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: 'se creó'
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @author = User.find(@tweet.user_id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end

end
