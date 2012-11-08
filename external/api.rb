require 'json'

class Api
  attr_accessor :host

  def initialize(host)
    self.host = host
  end

  def get(endpoint)
    JSON.parse(`curl -s https://#{host}#{endpoint}`)
  end

  def post(endpoint, data)
    JSON.parse(`curl -s -d '#{data}' https://#{host}#{endpoint}`)
  end
end
