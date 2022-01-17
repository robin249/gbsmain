class CreateStudentPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_payments do |t|
      t.references :sclass, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.string :txn_id
      t.float :total_amount
      t.string :session_duration, comment: 'like January-May or June-December, etc'
      t.string :session_year, comment: 'like 2020-2021'
      t.integer :status, default: 0, null: false, comment: 'pending, complete'
      t.integer :payment_mode, default: 0, null: false, comment: 'cash, cheque, upid'
      t.text :remarks
      t.boolean :is_deleted, default: false
      t.jsonb :options, default: {}
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
