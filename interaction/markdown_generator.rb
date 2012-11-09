class MarkdownGenerator
  attr_accessor :repos

  def initialize(repos)
    self.repos = repos
  end

  def generate
    markdown = '# This Week in Open Source'

    repos.each do |repo|
      markdown << "## [#{repo.name}](#{repo.url})\n"
      markdown << "#{repo.description}\n\n"

      repo.contributors.each do |contributor|
        if contributor.avatar_url
          markdown << "![avatar](#{contributor.avatar_url}) "
        end

        if contributor.handle
          markdown << "[#{contributor.name}](#{contributor.github_url})"
        else
          markdown << contributor.name
        end

        markdown << "\n\n"
      end
    end

    markdown
  end
end
