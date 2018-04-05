class TweetsController < ApplicationController
  before_action :make_client, only: [:index]

  def index
    @tweets = []
    if params[:keyword].present?
      @keyword = params[:keyword]
      tweets = @client.search(params[:keyword], count: 10, exclude: "retweets")
      @tweets = tweets.take(10).map{|tw| Tweet.new(tw.full_text)}
    end
  end

  def show
  end

  private

  def make_client
    @client = TwitterClient.new.client
  end
end
