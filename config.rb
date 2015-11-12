set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets
end

data.posts.each do |(id, post)|
  proxy "/posts/#{id}.html", 'post.html', locals: {post: post}
end

# XXX middleman のサブコマンドを実行する際にはこのブロックが評価されない…
activate :daimon_news do |config|
  config.service_url   = 'http://localhost:3000'
  config.service_token = '1'
end
