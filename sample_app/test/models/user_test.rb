# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(name:"Cqshinn",email:"cqshinn@gmail.com",password:'123456',password_confirmation:'123456')
    end

    test 'when\'s valid' do
        assert @user.valid?
    end

    test 'should invalid when length name larger than 30 or null' do
        @user.name = " "
        assert_not @user.valid?
        @user.name = '*'*60
        assert_not @user.valid?
    end

    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
            @user.email = valid_address
            assert @user.valid?, "#{valid_address.inspect} should be valid"
        end
    end

    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
            @user.email = invalid_address
            assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
        end
    end

    test "email validation when exitst" do
        @clone = @user.dup
        @user.email = @user.email.upcase
        @user.save
        assert_not @clone.valid?
    end
end
