class AddChefIdToRecipies < ActiveRecord::Migration
  def change
  	add_column :recipies, :chef_id, :integer
  end
end
