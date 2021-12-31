class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.references :sclass, null: true, foreign_key: true
      t.string :name
      t.string :code
      t.text :description
      t.boolean :is_optional_to_student, default: false, comment: 'All the subjects by default implement to the associated class. But if this flag set true then it is optional to student'
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end
  end
end
