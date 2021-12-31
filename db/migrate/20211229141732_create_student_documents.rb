class CreateStudentDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_documents do |t|
      t.references :student, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.json :attachments
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end
  end
end
