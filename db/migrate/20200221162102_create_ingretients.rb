class CreateIngretients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingretients do |t|
      t.string :name
      t.integer :calories
    end
  end
end
