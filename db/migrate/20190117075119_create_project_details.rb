class CreateProjectDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :project_details do |t|
      t.string :name
      t.string :contact_no
      t.string :email
      t.string :country
      t.text :description

      t.timestamps
    end
  end
end
