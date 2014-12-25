require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
    # test "the truth" do
    #   assert true
    # end
    test "invalid signup information" do
        get signup_path
        if User.count == 0
            assert_no_difference 'User.count' do
                post users_path, user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" }
            end
            assert_template 'users/new'

        else
            assert_difference 'User.count', 0 do
                post_via_redirect users_path, user: { name:  "Example User",
                                                      email: "michael@example.com",
                                                      password:              "password",
                                                      password_confirmation: "password" }
            end
            assert_template 'users/show'
            assert is_logged_in?
        end

    end

end
