class AddSubscriptionDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscription_date, :datetime
  end
end
