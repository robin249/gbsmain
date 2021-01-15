class CreateFeeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :fee_categories do |t|
      t.string :name
      t.text :description
      t.integer :billing_term, default: 0, null: false
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end

    add_index :fee_categories, :name
  end
end
