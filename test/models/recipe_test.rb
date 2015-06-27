require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		# @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
		@recipe = Recipe.new(name: 'Chicken Parm', summary: 'This is the best chicken parm ever!',
							 description: "heat oil, add garlic, add tomato sauce, add chicken, cook for 20min.")
	end


	test "recipe should be valid" do
		assert @recipe.valid?
	end

	# test "chef_id should be present" do
	# 	@recipe.chef_id = nil
	# 	assert_not @recipe.valid?
	# end

	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
		# this is saying the name is set to nothing, and assert_not means
		# if name is blank, say that @recipe is not valid.
	end

	test "name length should not be too long" do
		@recipe.name = "a" * 101
		assert_not @recipe.valid?
	end

	test "name length should not be too short" do
		@recipe.name = "a" * 4
		assert_not @recipe.valid?
	end

	test "Summary should be present" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end

	test "summary length should not be too long" do
		@recipe.summary = "a" * 151
		assert_not @recipe.valid?
	end

	test "summary length should not be too short" do
		@recipe.summary = "a" * 5
		assert_not @recipe.valid?
	end

	test "description should be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end

	test "description should not be too long" do
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end

	test "description should not be too short" do
		@recipe.description = "a" * 19
		assert_not @recipe.valid?
	end



end
