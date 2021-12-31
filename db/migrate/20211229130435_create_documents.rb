class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.boolean :is_mandatory, default: false
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end
  end
end
