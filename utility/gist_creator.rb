class GistCreator
  attr_accessor :markdown
  private :markdown

  def initialize(markdown='')
    self.markdown = markdown
  end

  def add_content(content)
    markdown << content.to_s
  end

  def create(name)
    data = {
      'public' => true,
      'files' => {
        name => {
          'content' => markdown
        }
      }
    }
    begin
      json = Github.post('/gists', data.to_json)
    rescue JSON::ParserError => e
      raise
    ensure
      Gist.new(json['html_url'], :errors => e)
    end
  end
end
