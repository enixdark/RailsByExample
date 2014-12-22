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

require 'spec_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    before { @user = User.new(name: "Example User", email: "user@example.com",
                              password: "123456789", password_confirmation: "123456789") }
    subject { @user }
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password)}
    it { should respond_to(:password_confirmation)}
    it { should respond_to(:authenticate) }
    it { should be_valid}

    describe "when user's name is blank" do
      before { @user.name = " " }
      it { should_not be_valid }
    end

    describe "when name length is too long" do
      before { @user.name = "n"*31 }
      it { should_not be_valid }
    end

    describe "when name length is too short" do
      before { @user.name = "n"*1 }
      it { should_not be_valid }
    end

    describe "when name length is validate" do
      before { @user.name = "cqshinn" }
      it { should be_valid }
    end

    describe "when email is validate" do
      it "should not be valid" do
        @email = %w[user@foo,com user at foo.org example.user@foo.foo@bar baz.com foo@bar+baz.com]
        @email.each do |ele|
          @user.email = ele
          @user.should_not be_valid
        end
      end

      it "should be valid" do
        @email = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        @email.each do |ele|
          @user.email = ele
          @user.should be_valid
        end
      end

    end

    describe "when email address is already taken" do

        before do
          @clone = @user.dup
          @clone.save
        end
        it { should_not be_valid }
    end

    # describe "when email address is already taken but use a upcase string" do
    #
    #     before do
    #       @clone2 = @user.dup
    #       @clone2.email = @user.email.upcase
    #       @clone2.save
    #     end
    #     it { should_not be_valid }
    # end

    describe "when password confirmation is nil" do
      before { @user.password_confirmation = nil }
      it { should_not be_valid }
    end

    describe "when password and password confirmation not the same" do
      before do
        @user.password = "1234567"
        @user.password_confirmation = "12345677"
      end

      it { should_not be_valid}
    end

    describe "when password and password confirmation not present" do
      before do
        @user.password = @user.password_confirmation = " "
      end

      it { should_not be_valid}
    end
  end




end
