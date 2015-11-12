module DaimonNews
  class Config
    attr_accessor :service_url, :service_token

    def initialize
      self.service_url   = 'http://localhost:3000'
      self.service_token = '1'
    end

    def posts_url
      URI.join(service_url, ['sites', service_token, 'posts.json'].join('/')).to_s
    end
  end
end
