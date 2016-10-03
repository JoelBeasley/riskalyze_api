module RiskalyzeAPI

  class << self
    attr_accessor :config
  end

  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield config
  end

  class Configuration
    attr_accessor :debug, :url, :api_key, :oauth_token, :authorization_type

    def initialize
      @authorization_type = 'ApiKey' # ApiKey | Bearer
      @debug = false
      @url = 'https://api2.riskalyze.com/ap/v1'
    end
  end

end
