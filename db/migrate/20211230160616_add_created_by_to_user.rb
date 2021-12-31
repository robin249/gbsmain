class AddCreatedByToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :created_by_id, :integer
    add_column :users, :updated_by_id, :integer

    add_column :sclasses, :created_by_id, :integer
    add_column :sclasses, :updated_by_id, :integer

    add_column :students, :created_by_id, :integer
    add_column :students, :updated_by_id, :integer

    add_column :fee_categories, :created_by_id, :integer
    add_column :fee_categories, :updated_by_id, :integer

    add_column :subjects, :created_by_id, :integer
    add_column :subjects, :updated_by_id, :integer

    add_column :documents, :created_by_id, :integer
    add_column :documents, :updated_by_id, :integer

    add_column :institutes, :created_by_id, :integer
    add_column :institutes, :updated_by_id, :integer
  end
end
