class GistCreator
  attr_accessor :markdown

  def initialize(markdown)
    self.markdown = markdown
  end

  def create
    data = {
      'public' => true,
      'files' => {
        'thank-you.md' => {
          'content' => markdown
        }
      }
    }
    json = Github.post('/gists', data.to_json)
    Gist.new(json['html_url'])
  end
end
