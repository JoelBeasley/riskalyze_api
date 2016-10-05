module RiskalyzeAPI
  class RiskalyzeAPIError < StandardError
    attr_reader :request

    def initialize(msg, request)
      @request = request
      super msg
    end
  end

  class RequestError < RiskalyzeAPIError
  end

  class AuthorizationError < RiskalyzeAPIError
  end
end