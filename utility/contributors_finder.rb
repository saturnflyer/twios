class ContributorsFinder
  attr_accessor :repo

  def initialize(repo)
    self.repo = repo
  end

  def since(date)
    Github.get("/repos/#{repo.full_name}/commits?since=#{date}").map do |json|
      Author.new(
        name: json['commit']['author']['name'],
        handle: json['author']['login'],
        avatar_url: json['author']['avatar_url']
      )
    end
  end
end
