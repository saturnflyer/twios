class MarkdownGenerator
  attr_accessor :repos

  def initialize(repos)
    self.repos = repos
  end

  def generate
    markdown = ''

    repos.each do |repo|
      markdown << "## [#{repo.name}](#{repo.url})\n"
      markdown << "#{repo.description}\n\n"

      repo.contributors.each do |contributor|
        markdown << "![avatar](#{contributor.avatar_url}) "
        markdown << "[#{contributor.name}](#{contributor.github_url})\n\n"
      end
    end

    markdown
  end
end
