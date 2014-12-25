require 'test_helper'

class UsersLogoutTest < ActionDispatch::IntegrationTest
  def setup
      @user = users(:cqshinn)
      get login_path
      post login_path,session: {email: @user.email,password: 'password'}
  end

  test 'logout from users' do

      get root_path
      assert_select "a[href=?]",logout_path
      delete logout_path
      follow_redirect!
      assert_select "a[href=?]",login_path

  end
end
