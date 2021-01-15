class CreateSclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :sclasses do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true
      t.jsonb :options, default: {}

      t.timestamps
    end

    add_index :sclasses, :name
  end
end
