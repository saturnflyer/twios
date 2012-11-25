require 'json'

class Api
  def initialize(host)
    @host = host
  end

  def get(endpoint)
    JSON.parse(`curl -s https://#{@host}#{endpoint}`)
  end

  def post(endpoint, data)
    JSON.parse(`curl -s -d '#{data.to_json}' https://#{@host}#{endpoint}`)
  end
end
