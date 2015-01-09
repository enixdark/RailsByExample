require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:cqshinn)
    end

    test "unsuccessful edit" do
        get edit_user_path(@user)
        assert_template 'users/edit'
        patch user_path(@user), user: { name:  "cqshinnr",
                                        email: "cqshinn92@rrgmail.com",
                                        password:              "password",
                                        password_confirmation: "paswword" }
        assert_template 'users/edit'
    end
end
