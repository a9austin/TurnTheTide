class UsersController < ApplicationController
  include UsersHelper

  before_filter :set_user, :set_categories
  def show
    #for debug
    @total = @user.total
    @feeds = Feed.all
    level_id = @user.karma.level_id
    @level = Level.find(level_id) 

    # Handle Savings regarding Energy, Money, Emissions
    # Place all of the saving tokens in an array {EMS, ENG, MNY}
    # Loop through all of them and place them in a Hash Table:w
    arr_saving_types = ["MNY", "EMS", "ENG"]
    @hash_savings_all = Hash.new
    @hash_savings_walk = Hash.new
    @hash_savings_bike = Hash.new
    @hash_savings_bus = Hash.new
    @hash_savings_train = Hash.new
    arr_saving_types.each do |type|
      @hash_savings_all[type] = calculate_total_saving(type, @total.total_walk_miles,
                                                        @total.total_bike_miles,
                                                        @total.total_bus_miles,
                                                        @total.total_train_miles)
      @hash_savings_walk[type] = calculate_saving(type, "WLK", @total.total_bike_miles) 
      @hash_savings_bike[type] = calculate_saving(type, "WLK", @total.total_bike_miles) 
      @hash_savings_bus[type] = calculate_saving(type, "BUS", @total.total_bus_miles) 
      @hash_savings_train[type] = calculate_saving(type, "TRN", @total.total_train_miles)
    end

    get_total_info()

    # Handle Air Quality
    #now = DateTime.now.in_time_zone(Time.zone)
    #aqs = AirQuality.where(:created_at => 
    #  now.beginning_of_day..now.end_of_day)
    airquality = AirQuality.last

    num = 1
    unless airquality.nil?
      num = airquality.number
      @category = airquality.category
    end
    aq_color = get_aq_color(num) 
    @html = "<i class='fa fa-cloud fa-2x text-center' style='color:" + aq_color + ";'></i>"
    @html_icon = @html.html_safe
  end

  private 
    # Gets value by the given type
    def helper_get_val(trip,type)
      val = 0;
      case type
      when "miles"
        val = trip.miles_saved
      when "trips"
        val = 1;
      when "emissions"
        val = trip.emissions_saved
      when "money"
        val = trip.money_saved
      when "energy"
        val = trip.energy_saved
      end
    end

    def get_aq_color(switch)
      val = ""
      case switch
        when 1
          val = "#00CC00";
        when 2
          val = "#FFFF00";
        when 3
          val = "#FF6600";
        when 4
          val = "#FF0000";
        when 5
          val = "#99004C";
        when 6
          val = "#7E0023";        
        end
      val
    end

    def set_categories
      @categories = ['bike', 'walk', 'train', 'bus']
    end

end
