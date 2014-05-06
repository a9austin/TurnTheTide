module VisualizationsHelper
  # Visualization Methods
  def get_label(token) 
    case token
      when "EMS"
        label = "Emissions"
      when "ENG"
        label = "Energy"
      when "MNY"
        label = "Money"
      when "MIL"
        label = "Miles"
      when "TRP"
        label = "Trips"
      when "ALL"
        label = "All"
      when "WLK"
        label = "Walk"
      when "BKE"
        label = "Bike"
      when "BUS"
        label = "Bus"
      when "TRN"
        label = "Train"
    end
    label
  end

  def initialize_hash_last_thirty_days()
    day_one = 30.days.ago
    hash = Hash.new
    # CASE: Same Month
    # If it happens to still be in the same month
    if day_one.month == Time.now.month
      for i in day_one.day..Time.now.day
       day_str = helper_format_zero_date(i)
       key = Time.now.month + "/" + day_str
       hash[key] = 0 
      end
    # CASE: Different Month 
    else
      month_str = helper_format_zero_date(day_one.month)
      last_day_prev_month = Date.civil(Time.now.year, day_one.month, -1).day 
      # Count from the previous to its last month
      for i in day_one.day..last_day_prev_month
       day_str = helper_format_zero_date(i)
       key = month_str + "/" + day_str
       hash[key] = 0
      end
      # Loop through current month
      month_str = helper_format_zero_date(Time.now.month)
      for i in 1..Time.now.day
        day_str = helper_format_zero_date(i)
        key = month_str + "/" + day_str
        hash[key] = 0
      end
    end
    hash
  end
  
  def initialize_hash_curr_month(selected_month)
    last_day = Date.civil(Time.now.year, selected_month, -1).day
    month_str = selected_month.to_s() 
    if (selected_month < 10)
      month_str.insert(0, "0")
    end
    hash = Hash.new
   for i in 1..last_day
    day_str = helper_format_zero_date(i)
    key = month_str + "/" + day_str
    hash[key] = 0
   end
   hash
  end

  def helper_format_zero_date(count)
    new_day = count.to_s();
    if count < 10
      new_day.insert(0,"0")
    end
    new_day
  end

  def set_total_values_in_hash(data_token, total_obj)
    walk_miles =  total_obj.total_walk_miles
    bike_miles =  total_obj.total_bike_miles
    bus_miles = total_obj.total_bus_miles
    train_miles = total_obj.total_train_miles
    car_miles = total_obj.total_car_miles

    # Handle Miles
    if walk_miles.nil?
      walk_miles = 0
    end

    if bike_miles.nil?
      bike_miles = 0
    end

    if bus_miles.nil?
      bus_miles = 0
    end

    if train_miles.nil?
       train_miles = 0
    end

    if car_miles.nil?
      car_miles = 0
    end

    # Handle Trips
    walk_trips = total_obj.total_walk_trips
    bike_trips = total_obj.total_bike_trips
    bus_trips = total_obj.total_bus_trips
    train_trips = total_obj.total_train_trips

    if walk_trips.nil?
      walk_trips = 0
    end

    if bike_trips.nil?
      bike_trips = 0
    end

    if bus_trips.nil?
      bus_trips = 0
    end

    if train_trips.nil?
      train_trips = 0
    end

    if data_token == "MIL"
      hash = { "Walk"  => walk_miles,
               "Bike"  => bike_miles,
               "Bus"   => bus_miles,
               "Train" =>  train_miles,
               "Car" => car_miles }
    elsif data_token == "TRP"
      hash = { "Walk"  => walk_trips,
               "Bike"  => bike_trips,
               "Bus"   => bus_trips,
               "Train" => train_trips }
    else
       hash = { "Walk"   => calculate_saving(data_token, "WLK", walk_miles),
                 "Bike"  => calculate_saving(data_token, "BKE", bike_miles),
                 "Bus"   => calculate_saving(data_token, "BUS", bus_miles),
                 "Train" => calculate_saving(data_token, "TRN", train_miles),
                 "Car" => calculate_saving(data_token, "CAR", car_miles) }
    end

  end
end
