class Gist
  attr_accessor :url, :errors

  def initialize(url,opts)
    self.errors = opts[:errors]
    self.url = url
  end

  def errors?
    !self.errors.nil?
  end
end