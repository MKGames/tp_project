class AddStandartSubscriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :standart_subscriber, :boolean, default: false
  end
end
