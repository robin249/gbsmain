class CreateStudentSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :student_subjects do |t|
      t.references :sclass, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.boolean :active, default: true
      t.string :session_duration, comment: 'like January-May or June-December, etc'
      t.string :session_year, comment: 'like 2020-2021'
      t.jsonb :options, default: {}
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
