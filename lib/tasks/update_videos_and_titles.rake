namespace :exercise do
  desc "Update exercise videos and titles based on day from a text file"
  task :update_videos_and_titles, [:day_id, :file_name] => :environment do |_t, args|
    raise "You must specify a day ID" unless args[:day_id]
    raise "You must specify a file name" unless args[:file_name]

    file_path = Rails.root.join(args[:file_name])
    raise "File not found: #{file_path}" unless File.exist?(file_path)

    # Read the file, strip whitespace, and reject blank lines
    lines = File.readlines(file_path).map(&:strip).reject(&:empty?)
    exercises = Exercise.where(day_id: args[:day_id])

    updated_count = 0
    exercises.find_each.with_index do |exercise, index|
      if index >= lines.length
        puts "Not enough data for all exercises. Stopped at exercise ##{exercise.id}."
        break
      end

      video_url = lines[index]
      exercise.assign_attributes(video: video_url)

      # Extract string between last slash and dot in the video URL and update title
      title_match = video_url.match(%r{[^\/]+(?=\.[^.]+$)})
      exercise.assign_attributes(title: title_match[0]) if title_match

      if exercise.changed?
        if exercise.save
          puts "Exercise ##{exercise.id} updated - Video: #{video_url}, Title: #{exercise.title}"
          updated_count += 1
        else
          puts "Failed to update Exercise ##{exercise.id}: #{exercise.errors.full_messages.join(", ")}"
        end
      else
        puts "No changes for Exercise ##{exercise.id}, Video URL was already: #{video_url}, Title: #{exercise.title}"
      end
    end

    puts "Updated videos and titles for #{updated_count} out of #{exercises.count} exercises on day #{args[:day_id]}."
  end
end
