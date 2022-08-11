class AddExpToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :exp_sum, :float, default: 1
  end
end
