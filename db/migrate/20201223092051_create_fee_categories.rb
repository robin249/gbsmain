class CreateFeeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :fee_categories do |t|
      t.string :name
      t.text :description
      t.integer :billing_term, default: 0, null: false
      t.boolean :is_concesion, default: false
      t.boolean :is_optional_to_student, default: false, comment: 'All the fee categories by default implement to the associated class. But if this flag set true then it is optional to student'
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end

    add_index :fee_categories, :name
  end
end
