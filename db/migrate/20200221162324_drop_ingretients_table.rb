class DropIngretientsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :ingretients
  end
end
