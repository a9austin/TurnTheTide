require 'date'
require 'time'

namespace :db do 
  desc "Fill database with sample data"
  task populate: :environment do
    # Generate User
    User.create!(username: "Jane Doe",
                 email: "user@gmail.com",
                 password: "password",
                 team_id: 1)
    # Generate Karma
    Karma.create!(
                  points: 1320,
                  rank: 4,
                  user_id: 1)
    # Generate User Stat's
    Total.create!(user_id: 1,
                  total_trips: 60,
                  total_miles: 500,
                  total_walk_trips: 4,
                  total_walk_miles: 6,
                  total_bike_trips: 20,
                  total_bike_miles: 15,
                  total_bus_trips: 20,
                  total_bus_miles: 150,
                  total_train_trips: 25,
                  total_train_miles: 250)
        # Generate Team
    Team.create!(name: "AF-14",
                 rank: 10)
    10.times do
      message = Faker::Lorem.sentence(3)
      username = Faker::Name.name
      Feed.create!(message: message,
                  username: username) 
    end
    60.times do
      date = rand_time(1.month.ago).to_datetime
      walk_miles = rand_miles("walk")
      bike_miles = rand_miles("bike")
      bus_miles = rand_miles("bus")
      train_miles = rand_miles("train")
      Trip.create!(date: date,
                   walk_miles: walk_miles, 
                   bike_miles: bike_miles,
                   bus_miles: bus_miles,
                   train_miles: train_miles,
                   user_id: 1)
    end
  end
  def rand_miles(category)
    miles = 0;
    case category
    when "walk"
      miles = Random.new.rand(1..5);
    when "bike"
      miles = Random.new.rand(1..10);
    when "train"
      miles = Random.new.rand(1..30);
    when "bus"
      miles = Random.new.rand(1..15);
    end
    miles
  end

  def rand_category 
    arr = ["walk", "bike", "train", "bus"];
    random = Random.new.rand(0..3);
    arr[random]
  end

  def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end

  def rand_in_range(from, to)
    rand * (to - from) + from
  end

  def to_datetime
    # Convert seconds + microseconds into a fractional number of seconds
    seconds = sec + Rational(usec, 10**6)

    # Convert a UTC offset measured in minutes to one measured in a
    # fraction of a day.
    offset = Rational(utc_offset, 60 * 60 * 24)
    DateTime.new(year, month, day, hour, min, seconds, offset)
  end

end
