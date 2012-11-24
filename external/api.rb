require 'json'

class Api
  attr_accessor :host

  def initialize(host)
    self.host = host
  end

  def get(endpoint)
    JSON.parse(`curl -s https://#{host}#{endpoint}`)
  end
end
