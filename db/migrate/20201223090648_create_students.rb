class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.references :sclass, null: false, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :roll_number
      t.string :phone_number
      t.string :emergency_number
      t.string :email
      t.string :father_name
      t.string :mother_name
      t.text :permanent_address
      t.text :residential_address
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end
    add_index :students, :first_name
    add_index :students, :last_name
    add_index :students, :roll_number
  end
end
