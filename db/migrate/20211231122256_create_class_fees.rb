class CreateClassFees < ActiveRecord::Migration[6.0]
  def change
    create_table :class_fees do |t|
      t.references :sclass, null: false, foreign_key: true
      t.references :fee_category, null: false, foreign_key: true
      t.float :amount, default: 0
      t.boolean :active, default: true
      t.jsonb :options, default: {}
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
