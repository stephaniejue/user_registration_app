class ChangeIntegerToBigintInPhonesTable < ActiveRecord::Migration
  def change
    change_column :phones, :number, :bigint
  end
end
