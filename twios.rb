%w(data context interaction external).each do |directory|
  Dir["#{Dir.pwd}/#{directory}/*.rb"].each do |file|
    require file
  end
end

context = ThankingContext.new
context.thank
