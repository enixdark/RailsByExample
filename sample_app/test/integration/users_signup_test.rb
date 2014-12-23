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
        else
            assert_difference 'User.count', 1 do
                post_via_redirect users_path, user: { name:  "Example User",
                                                      email: "user@example.com",
                                                      password:              "password",
                                                      password_confirmation: "password" }
            end
        end

        assert_template 'users/new'

    end

end
