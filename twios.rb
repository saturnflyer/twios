%w(data context utility).each do |directory|
  Dir["#{Dir.pwd}/#{directory}/*.rb"].each do |file|
    require file
  end
end

require 'date'

since_one_week_ago = Date.today - 7
twitter_account = STDOUT # or some twitter object
repositories = ReposBuilder.new('thoughtbot', Thoughtbot::REPOS).build

thanking = Thanking.new(since_one_week_ago, repositories, twitter_account)
thanking.announce
