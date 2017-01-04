class ChangeIntegerLimitInPhonesTable < ActiveRecord::Migration
  def change
    change_column :phones, :number, :integer, limit: 8
  end
end
