class CreateInstitutes < ActiveRecord::Migration[6.0]
  def change
    create_table :institutes do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end
  end
end
