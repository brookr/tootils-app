Factory.define :score do |score|
  score.user 
  score.points { 1 }
  score.source { 'string' }
end
