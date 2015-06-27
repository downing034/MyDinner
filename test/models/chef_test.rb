require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefname: "Paul Downing", email: "downing034@gmail.com")
	end

	test "test chef should be valid" do
		assert @chef.valid?
	end

	test "chefname should be present" do
		@chef.chefname = " "
		assert_not @chef.valid?
	end

	test "chefname should not be too long" do
		@chef.chefname = "a" * 41
		assert_not @chef.valid?
	end

	test "chefname should not be too short" do
		@chef.chefname = "a" * 3
		assert_not @chef.valid?
	end

	test "email should be present" do
		@chef.email = " "
		assert_not @chef.valid?
	end

	test "email should be within range" do
		@chef.email = "a" * 101 + "@gmail.com"
		assert_not @chef.valid?
	end

	test "email address should be unique" do
		dup_chef = @chef.dup
		dup_chef.email = @chef.email.upcase
		@chef.save
		assert_not dup_chef.valid?
	end

	test "email validation should accept valid addresses" do
		valid_addresses = %w[user@eee.com PD_TD-DS@email.hello.com first.last@user.au laura+joe@monk.edu]
		valid_addresses.each do |va|
			@chef.email = va
			assert @chef.valid?, "#{va.inspect} should be valid"
		end
	end

	test "email validaiton should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_work.org user@emai. e@I_L_P.com foo@eee+car.com]
		invalid_addresses.each do |ia|
			@chef.email = ia
			assert_not @chef.valid?, "#{ia.inspect} is invalid"
		end
	end

end