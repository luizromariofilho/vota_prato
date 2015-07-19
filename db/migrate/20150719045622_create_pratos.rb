class CreatePratos < ActiveRecord::Migration
  def change
    create_table :pratos do |t|

      t.timestamps null: false
    end
  end
end
