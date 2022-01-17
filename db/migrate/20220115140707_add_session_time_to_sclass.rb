class AddSessionTimeToSclass < ActiveRecord::Migration[6.0]
  def change
    add_column :sclasses, :session_time, :integer, default: 12, null: false
  end
end
