class AddTotalMonthsToStudentFee < ActiveRecord::Migration[6.0]
  def change
    add_column :student_fees, :total_months, :integer, default: 1
  end
end
