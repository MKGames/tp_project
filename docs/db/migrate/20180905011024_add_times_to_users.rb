class AddTimesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tear2_time, :datetime
    add_column :users, :tear3_time, :datetime
  end
end
