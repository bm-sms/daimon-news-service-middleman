require 'json'
require 'fileutils'

require 'httpclient'

module Middleman::Cli
  class FetchPosts < Thor
    check_unknown_options!

    namespace :fetch_posts

    desc 'fetch_posts [options]', 'Fetch posts from service API'
    def fetch_posts
      url = DaimonNews::Extension.config.posts_url

      response = HTTPClient.get(url)
      data = JSON.parse(response.body)

      data_path = 'data/posts' # TODO Extract as option

      FileUtils.mkdir_p data_path

      FileUtils.cd data_path do
        data.each do |post|
          File.write("#{post['id']}.json", post.to_json)
        end
      end
    end
  end
end
