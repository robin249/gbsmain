class AddSessionDurationSclasses < ActiveRecord::Migration[6.0]
  def change
    add_column :sclasses, :session_duration, :integer, default: 0, null: false
  end
end
