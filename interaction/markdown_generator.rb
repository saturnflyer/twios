class MarkdownGenerator
  attr_accessor :repos

  def initialize(repos)
    self.repos = repos
  end

  def generate
    markdown = "# This Week in Open Source\n\n"
    markdown << "Thanks to this week's contributors to "
    markdown << "[thoughtbot](http://github.com/thoughtbot) projects.\n\n"

    repos.each do |repo|
      if repo.contributors.any?
        markdown << "## [#{repo.name}](#{repo.url})\n"
        markdown << "#{repo.description}\n\n"
      end

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
