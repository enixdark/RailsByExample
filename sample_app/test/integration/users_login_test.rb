require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:cqshinn)
    end

    # test "login path with invalid information" do
    #
    #   get login_path
    #   assert_template 'sessions/new','should be validate login path'
    #
    #   post login_path, session: {email:'',password:''}
    #   assert_template 'sessions/new', 'should be invalidate user login'
    #   assert_not flash.empty? ,'when user not authenticate'
    #   post login_path, session: {email:'cqshinn92@gmail.com',password:'123456'}
    #   assert_template root_path,'should be validate user login'
    #   # assert flash.empty? ,'when user is authenticate'
    #
    #
    # end

    test 'login with valid' do
        get login_path
        post login_path, session: {email: @user.email,password: 'password'}
        assert_redirected_to @user
        follow_redirect!
        assert_template 'users/show'
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user)

        delete logout_path
        assert_not is_logged_in?
        assert_redirected_to root_path
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path,      count: 0
        assert_select "a[href=?]", user_path(@user), count: 0




    end
end
