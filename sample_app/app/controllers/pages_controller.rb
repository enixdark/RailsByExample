class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"

  end

  def about
    # @title = "About"

  end

  def hekp
    @title = "Help"
  end
end
