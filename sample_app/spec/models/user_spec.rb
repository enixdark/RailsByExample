# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    before { @user = User.new(name: "Example User", email: "user@example.com") }
    subject { @user }
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should be_valid}

    describe "when not user's name is blank" do
      before { @user.name = " " }
      it { should_not be_valid }
    end

  end


end
