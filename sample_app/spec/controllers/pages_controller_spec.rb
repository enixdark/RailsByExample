require 'spec_helper'
require 'pry-byebug'
describe PagesController, :type => :controller do
  render_views

  before(:each) do
  #
  # Define @base_title here.
    @base_title = "Ruby on Rails Tutorial Sample App"
  #
  end

  describe "GET 'home'" do
    it "should be successful" do
      get :home
      expect(response).to have_http_status(:success)      # binding.pry
    end

    # it "should have the right title" do
    #   puts @base_title
    #   get 'home'
    #   response.should have_selector?("title",
    #                                 :content => @base_title + " | Home")
    # end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get :contact
      expect(response).to have_http_status(:success)      # binding.pry
    end
  end


  describe "GET 'about'" do
    it 'should be successful' do
      get :about
      expect(response).to have_http_status(:success)      # binding.pry
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get :help
      expect(response).to have_http_status(:success)      # binding.pry
    end
  end

end
