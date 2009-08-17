class Punctualize < Stream
  def report(score)
    client.update("@#{score.user.name} Got it! I've registered your Punctualness" +
    " of #{score.status}. That gives you a new Punctuality Score of #{score.average} minutes.")
  end
  
  def regexp
    /-?\d+/
  end
end