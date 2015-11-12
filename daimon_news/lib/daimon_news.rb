require 'daimon_news/version'
require 'daimon_news/cli'

module DaimonNews
  autoload :Extension, 'daimon_news/extension'
  autoload :Config,    'daimon_news/config'

  class << self
    def configure
      yield DaimonNews::Extension.config
    end
  end
end

Middleman::Extensions.register :daimon_news do
  ::DaimonNews::Extension
end
