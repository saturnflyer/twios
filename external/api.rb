require 'json'

# Example usage:
#
#     Github = Api.new('api.github.com')
#     Github.get("/repos/#{repo_name}/commits?since=#{date}")
#     Github.post('/gists', data.to_json)

class Api
  def initialize(host)
    @host = host
  end

  def get(endpoint)
    JSON.parse(`curl -s https://#{@host}#{endpoint}`)
  end

  def post(endpoint, data)
    JSON.parse(`curl -s -d '#{data}' https://#{@host}#{endpoint}`)
  end
end
