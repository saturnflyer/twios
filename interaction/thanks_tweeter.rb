class ThanksTweeter
  def tweet
    text = "Thank you, this week's open source contributors! #{gist_url}"
    tweet = Tweet.new(text)
    tweet.publish
  end
end
