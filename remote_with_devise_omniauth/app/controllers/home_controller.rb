class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new]


  def new
  end





  def index
  end
end
