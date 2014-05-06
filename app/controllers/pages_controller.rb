class PagesController < ApplicationController
  def home
   @feeds = Feed.all
    if user_signed_in?
      redirect_to users_path
    end
  end

  def about
  end

  def faq
  end

  def contact
  end

  def tutorial
  end

  def levels
  end
end
