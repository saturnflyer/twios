# Goal: to print details of contributions and tweet about it
# Primary actor: twitter account
# Secondary actors: repositories, a gist
# Preconditions: repositories are already collected

class Thanking
  def initialize(since_date, repositories, tweeter)
    @repositories = repositories.extend(RepositoriesPrinter)
    @host = tweeter.extend Host
    @since = since_date
  end

  attr_reader :host, :repositories, :since

  def announce
    host.thank_contributors(self)
  end

  def card
    @card ||= GistCreator.new
  end

  module Host
    def intro
      %{
        # This Week in Open Source

        Thanks to this week's contributors to

        [thoughtbot](http://github.com/thoughtbot) projects.

      }
    end

    def thank_contributors(context)
      card = context.card

      card.add_content(intro)
      context.repositories.print_on(card, context.since)
      card.create('thank-you')

      announce(card)
    end

    def announce(card)
      if card.errors?
        puts("Oops! #{card.errors}")
      else
        puts("Thank you, this week's open source contributors! #{card.url}")
      end
    end
  end

  module RepositoriesPrinter
    def print_on(card, last_time)
      each do |repository|
        card.add_content(details_for(repository))
        card.add_content(contributor_details_for(ContributorsFinder.new(repository).since(last_time)))
      end
    end

    def details_for(repository)
      %{
        ## [#{repository.full_name}](#{repository.url})

        #{repository.description}

      }
    end

    def contributor_details_for(contributors)
      contributors.collect{|contributor|
        %{
          ![avatar](#{contributor.avatar_url})

          [#{contributor.name}](#{contributor.github_url})
        }
      }.join('')
    end
  end
end