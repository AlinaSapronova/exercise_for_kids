unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "db:seed",
      "dev:sample_data"
    ]

    desc "Adds sample data for development environment"
    task sample_data: :environment do
      puts "TODO"
    end
  end
end
