require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/api'

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
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_children",
      "dev:add_challenge",
      "dev:add_days",
      "dev:add_exercises"
    ] do
      puts "done adding sample data"
    end

    task add_users: :environment do
      User.destroy_all
      puts "adding users..."

      # Create a user
      names = ["Alice", "Bob", "Mary"]
      names.each do |name|
        u = User.create(
          email: "#{name}@example.com",
          name: name,
          password: "password"
        )
        puts "added #{u.email} and #{u.name}"
      end
      puts "done"
    end

    task add_children: :environment do
      Child.destroy_all
      puts "adding children"
      # Create a child associated with the user
      names = ["Stan", "Helen", "Dima"]

      names.each do |name|
       child = Child.create(
        user_id: User.all.sample.id, 
        name: name,
        birthday: Faker::Date.birthday(min_age: 4, max_age: 7)
       )
       puts "added #{child.name} and #{child.birthday}"
      end
      puts "done"
    end




    task add_challenge: :environment do
      Challenge.destroy_all
      puts "adding challenge"
      # Challenge.all.each do |p|
        5.times do |i|
          ch = Challenge.create(
            active: false ,
            user_id: User.all.sample.id,
            child_id: Child.all.sample.id,
            number_of_days: rand(7).to_i,
            title: 'Days Challenge'
          )
          puts "added #{ch.number_of_days} #{ch.title}"
        end
        puts "done"
      end
    

    task add_days: :environment do
      Day.destroy_all
      puts "adding days"
      8.times do |i|
        day = Day.new
         day.challenge_id = Challenge.all.sample.id
         day.completed_at = Faker::Date.forward(from: Date.current, days: 30)
         day.save
    end
  end
        puts "done"

      task add_exercises: :environment do
        Exercise.destroy_all
        Day.all.each do |d|
        10.to_i.times do |i|
          ex = Exercise.new
             ex.day_id = d.id
             ex.save
         end
        end
      end
        puts "adding exercises"
        puts "done"
      end      
  end
