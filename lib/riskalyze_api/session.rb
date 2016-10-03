module RiskalyzeAPI

  class << self
    attr_accessor :session
  end

  def self.session
    @session ||= Session.new
  end

  class Session

    attr_reader :config

    def initialize
      @config = RiskalyzeAPI.config
      yield @config if block_given?
    end

    def post(resource, params)
      handle_response HTTParty.post(
          url([resource, id]),
          headers: headers,
          body: params
      )
    end

    def get(resource, id = nil)
      handle_response HTTParty.get(
          url([resource, id]),
          headers: headers
      )
    end

    def put(resource, id, params)
      handle_response HTTParty.put(
          url([resource, id]),
          headers: headers,
          body: params
      )
    end

    def delete(resource, id)
      handle_response HTTParty.delete(
          url([resource, id]),
          headers: headers
      )
    end

    private

    def url(parts)
      "#{config.url}/#{parts.compact.join('/')}"
    end

    def headers
      headers = { 'Accept' => 'application/json' }

      if config.authorization_type == 'ApiKey'
        headers['Authorization'] = "ApiKey #{config.api_key}"
      else
        headers['Authorization'] = "Bearer #{config.oauth_token}"
      end

      headers
    end

    def handle_response(response)
      raise RequestError.new(response.response.msg, response.response) if response.code != 200

      response.parsed_response
    end

  end
end