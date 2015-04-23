require "cancan/matchers"
require "rails_helper" 

describle Ability do
	describle "destroy a post" do
		describle "guest user" do
			let(:ability) { Ability.new nil }

			it 'cannot destroy a post' do
				ability.should_not be_able_to(
					:destroy, Post.new(user: nil)
					)
				ability.should_not be_able_to(
					:destroy, Post.new
					)
			end
		end
	end
end