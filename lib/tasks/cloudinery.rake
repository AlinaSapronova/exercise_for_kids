# lib/tasks/cloudinary_videos.rake
require 'cloudinary'

namespace :cloudinary_videos do
  desc 'Retrieve video URLs and write to a file'
  task :fetch_video_urls, [:folder_name, :file_name] => :environment do |_t, args|
    raise 'Folder name is required' unless args[:folder_name]
    file_name = args[:file_name] || 'video_urls.txt'

    Cloudinary.config do |config|
      config.cloud_name = ENV['CLOUD_NAME']
      config.api_key = ENV['CLOUD_KEY']
      config.api_secret = ENV['CLOUDINARY_API_SECRET']
      config.secure = true
    end

    begin
      result = Cloudinary::Api.resources(
        resource_type: 'video',
        type: 'upload',
        prefix: args[:folder_name],
        max_results: 500
      )

      urls = result['resources'].map { |video| video['secure_url'] }

      # Write URLs to a text file, each URL on a new line
      File.open(file_name, 'w') do |file|
        file.puts urls.join("\n")
      end

      puts "Video URLs written to #{file_name}"
    rescue Cloudinary::Api::RateLimited => e
      puts "Rate limit exceeded: #{e.message}"
    rescue Cloudinary::Api::AuthorizationRequired => e
      puts "Authorization error: #{e.message}"
    rescue Cloudinary::Api::NotFound => e
      puts "Not found: #{e.message}"
    rescue => e
      puts "An error occurred: #{e.message}"
    end
  end
end
