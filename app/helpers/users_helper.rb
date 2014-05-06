module UsersHelper
  include VisualizationsHelper  
  # Calculation Methods
  def calculate_saving(token, trans_type, miles)
    if miles.nil? || miles == 0
      val = 0
    else
      case token
        when "EMS"
          val = 0.01064 * miles
          if trans_type == "WLK" || trans_type == "BKE"
            val = val + 0.02474
          end
        when "MNY"
          if trans_type != "CAR"
            val = 0.61 * miles
          end
        when "ENG"
          val = 0.04545 * miles
      end 
      unless val.nil?
        val = val.round(2)
      end
    end
  end

  def calculate_total_saving(token, walk_miles, bike_miles, bus_miles, train_miles)
      walk = calculate_saving(token, "WLK", walk_miles)
      bike = calculate_saving(token, "BKE", bike_miles)
      bus = calculate_saving(token, "BUS", bus_miles)
      train = calculate_saving(token, "TRN", train_miles)

      if walk.nil?
        walk = 0
      else
        walk = walk.round(2)
      end

      if bike.nil?
        bike = 0
      else
        bike = bike.round(2)
      end

      if bus.nil?
        bus = 0
      else 
        bus = bus.round(2)
      end

      if train.nil?
        train = 0
      else 
        train = train.round(2)
      end

      total = walk + bike + bus + train
      total.round(2)
  end

  def set_user
    @user = current_user
  end

  def get_total_info()
    @total = @user.total 
    @miles_hash = set_total_values_in_hash("MIL", @total) 
    @emissions_hash = set_total_values_in_hash("EMS", @total)
    @money_hash = set_total_values_in_hash("MNY", @total)
    @energy_hash = set_total_values_in_hash("ENG", @total)
    @trips_hash = set_total_values_in_hash("TRP", @total)
  end

end

