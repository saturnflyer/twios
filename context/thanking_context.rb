require 'date'

class ThankingContext
  attr_accessor :last_thank_you, :repos, :markdown, :gist

  def initialize
    self.last_thank_you = one_week_ago
  end

  def thank
    build_repos
    find_contributors
    generate_markdown
    puts markdown
  end

  private

  def one_week_ago
    Date.today - 7
  end

  def build_repos
    self.repos = ReposBuilder.new('thoughtbot', Thoughtbot::REPOS).build
  end

  def find_contributors
    repos.each do |repo|
      finder = ContributorsFinder.new(repo)
      repo.contributors = finder.since(last_thank_you).uniq.sort
    end
  end

  def generate_markdown
    self.markdown = MarkdownGenerator.new(repos).generate
  end
end
