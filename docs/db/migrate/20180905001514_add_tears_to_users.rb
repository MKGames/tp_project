class AddTearsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tear2_subscriber, :boolean
    add_column :users, :tear3_subscriber, :boolean
  end
end
