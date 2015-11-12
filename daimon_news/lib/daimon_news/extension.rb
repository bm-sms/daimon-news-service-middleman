module DaimonNews
  class Extension
    class << self
      def registered(app)
        yield config if block_given?
      end

      def config
        @config ||= DaimonNews::Config.new
      end
    end
  end
end
