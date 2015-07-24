class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :code, null: false

      t.timestamps null: false
    end
  end
end
