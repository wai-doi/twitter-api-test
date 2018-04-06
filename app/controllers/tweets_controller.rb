class TweetsController < ApplicationController
  before_action :make_client, only: [:search, :post, :time_post]

  def top
  end

  def search
    @tweets = []
    if params[:keyword].present?
      @keyword = params[:keyword]
      tweets = @client.search(params[:keyword], count: 10, exclude: "retweets")
      @tweets = tweets.take(10).map{|tw| Tweet.new(tw.full_text)}
    end
  end

  def trend

  end

  def post
    if params[:message].present?
      @client.update(params[:message])
    end
    redirect_to root_path
  end

  def time_post
    now = Time.now.to_s
    @client.update(now)
    redirect_to root_path
  end

  private

  def make_client
    @client = TwitterClient.new.client
  end
end
