class Repo
  attr_accessor :organization, :name, :description, :contributors

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send(:"#{key}=", value)
    end
  end

  def full_name
    "#{organization}/#{name}"
  end

  def url
    "https://github.com/#{full_name}"
  end
end
