Cloudinary.config do |config|
  config.cloud_name = ENV.fetch["CLOUD_NAME"]
  config.api_key = ENV.fetch["CLOUD_KEY"]
  config.api_secret = ENV.fetch["CLOUD_SECRET"]
  config.cdn_subdomain = true
end
