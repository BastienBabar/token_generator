class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :identifier

      t.belongs_to :company, foreign_key: true, index: true

      t.timestamps
    end
  end
end
