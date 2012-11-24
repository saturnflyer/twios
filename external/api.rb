require 'json'

class Api
  attr_accessor :host

  def initialize(host)
    self.host = host
  end

  def get(endpoint)
    response = `curl -s https://#{host}#{endpoint}`
    JSON.parse(response)
  end

  def post(endpoint, data)
    response = `curl -s -d '#{data.to_json}' https://#{host}#{endpoint}`
    JSON.parse(response)
  end
end
