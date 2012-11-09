class Author
  attr_accessor :name, :handle, :avatar_url

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send(:"#{key}=", value)
    end
  end

  def name
    @name || @handle
  end

  def github_url
    "https://github.com/#{handle}"
  end

  def eql?(other)
    if handle && other.handle
      handle == other.handle
    elsif name && other.name
      name == other.name
    elsif handle.nil? && other.handle.nil? && name.nil? && other.handle.nil?
      true
    else
      false
    end
  end

  def hash
    handle.to_i
  end
end
