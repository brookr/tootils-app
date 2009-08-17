class TwitTree < Stream
  def report(graph)
    client.update("@#{user.name} Got it! You are #{degrees} degrees from #{end_user}." +
    " You are linked by: #{user.name} -> ... -> #{end_user.name}")
  end
  
  def regexp
    /@\w+/
  end
end