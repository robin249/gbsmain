class AddInstituteInUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :institute, null: true, foreign_key: true
    add_reference :sclasses, :institute, null: true, foreign_key: true
    add_reference :students, :institute, null: true, foreign_key: true
    add_reference :fee_categories, :institute, null: true, foreign_key: true
    add_reference :subjects, :institute, null: true, foreign_key: true
    add_reference :documents, :institute, null: true, foreign_key: true
  end
end
