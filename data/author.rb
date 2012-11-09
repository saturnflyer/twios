class Author
  attr_accessor :name, :handle, :avatar_url

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send(:"#{key}=", value)
    end
  end

  def github_url
    "https://github.com/#{handle}"
  end

  def eql?(other)
    self.handle == other.handle
  end

  def hash
    handle.to_i
  end
end
