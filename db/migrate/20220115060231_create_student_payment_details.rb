class CreateStudentPaymentDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :student_payment_details do |t|
      t.references :student_payment, null: false, foreign_key: true
      t.references :student_fee, null: false, foreign_key: true
      t.float :amount
      t.text :remarks
      t.integer :status, default: 0, null: false, comment: 'pending, complete'
      t.boolean :is_deleted, default: false
      t.jsonb :options, default: {}

      t.timestamps
    end
  end
end
