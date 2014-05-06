class VisualizationsController < ApplicationController
  before_filter :set_user
  include UsersHelper
  include VisualizationsHelper

  def linechart
    @category_token = params[:category_token]
    @data_token = params[:data_token]
    curr_month = params[:month]
    control_switch = params[:control]

    # Get the last trips from 30 days ago
    year = Time.now.year 
    # CASE: Current Month
    if curr_month.nil? || curr_month == 0
      @month = Time.now.month
    else
    # CASE: Previous Month
      curr_month = Integer(curr_month)
      if control_switch == "prev"
        if curr_month == 1
          @month = 12
        else
          @month = curr_month - 1
        end
      else
        if curr_month == 12
          @month = 1
        else
          @month = curr_month + 1;
        end
      end
    end

    # Handle the last 30 days, or handle by month
    if control_switch != "prev" && control_switch != "next"
      @linechart_header = "Last 30 Days"
      @data_hash = initialize_hash_last_thirty_days()
      @test_hash = initialize_hash_last_thirty_days()
      @recent_trips = @user.trips.where('created_at > ?', 30.days.ago)
      @m2 = Date::MONTHNAMES[Time.now.month]
      @m1 = Date::MONTHNAMES[30.days.ago.month]
      @linechart_header += " (" + @m1 +" - " + @m2 + ")"
    else
      @linechart_header = Date::MONTHNAMES[@month] + " " + year.to_s;
      @data_hash = initialize_hash_curr_month(@month)
      selected_month = Date.new(year, @month).to_time
      @recent_trips = @user.trips.where(:date => selected_month..selected_month.end_of_month)
    end
    
    @data_label = get_label(@data_token)
    @category_label = get_label(@category_token)
    @recent_trips.each do |trip|
    key_date = trip.date.strftime("%m/%d") 
    curr_val = @data_hash[key_date]
    if curr_val.nil? || curr_val == 0
      curr_val = 0;
    end
      if @data_token == "TRP"
        curr_val += 1
      else
        # Handle the case if the current value has not been set yet
        case @category_token
          when "WLK"
            curr_val += trip.walk_miles
          when "BKE"
            curr_val += trip.bike_miles
          when "BUS"
            curr_val += trip.bus_miles
          when "TRN"
            curr_val += trip.train_miles
          when "ALL"
            curr_val += trip.walk_miles + trip.bike_miles +
              trip.bus_miles + trip.train_miles
        end

        # Handle Miles special case
        if @data_token != "MIL" && @data_token != "TRP"
          if @category_token == "ALL"
            curr_val = calculate_total_saving(@data_token,
                                               trip.walk_miles,
                                               trip.bike_miles,
                                               trip.bus_miles,
                                               trip.train_miles)
          else
            curr_val = calculate_saving(@data_token, @category_token, curr_val)
          end
        end
      end
      @data_hash[key_date] = curr_val
    end
  end

  def piechart
    @total = @user.total 
    @miles_hash = set_total_values_in_hash("MIL", @total) 
    @emissions_hash = set_total_values_in_hash("EMS", @total)
    @money_hash = set_total_values_in_hash("MNY", @total)
    @energy_hash = set_total_values_in_hash("ENG", @total)
    @trips_hash = set_total_values_in_hash("TRP", @total)
    @car_hash = set_total_values_in_hash("CAR", @total)
  end

end
