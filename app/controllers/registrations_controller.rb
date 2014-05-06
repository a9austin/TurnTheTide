class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create 
    super
    # Ensure the registration was successful
    if user_signed_in?
      initialize_user_entities
    end
  end

  def update
    super
  end
  
  private
  def initialize_user_entities
    new_total = Total.new
    new_total.user_id = current_user.id 
    new_total.save
    new_karma = Karma.new
    new_karma.points = 0;
    new_karma.rank = 0;
    new_karma.user_id = current_user.id
    new_karma.level_id = 1
    new_karma.save
  end
end
