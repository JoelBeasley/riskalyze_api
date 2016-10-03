module RiskalyzeAPI
  class RequestError < StandardError
    attr_reader :request

    def initialize(msg, request)
      @request = request
      super msg
    end
  end
end