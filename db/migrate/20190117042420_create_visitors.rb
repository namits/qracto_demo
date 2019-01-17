class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.string :mobile_no
      t.string :country

      t.timestamps
    end
  end
end
