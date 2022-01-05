class CreateStudentFees < ActiveRecord::Migration[6.0]
  def change
    create_table :student_fees do |t|
      t.references :sclass, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :fee_category, null: false, foreign_key: true
      t.float :amount, default: 0
      t.float :concession, default: 0
      t.string :session_duration, comment: 'like January-May or June-December, etc'
      t.string :session_year, comment: 'like 2020-2021'
      t.boolean :active, default: true
      t.jsonb :options, default: {}
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
