require 'daimon_news/version'

module DaimonNews
  autoload :Extension, 'daimon_news/extension'
end

Middleman::Extensions.register :daimon_news do
  ::DaimonNews::Extension
end
