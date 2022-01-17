class StudentFee < ApplicationRecord
  include Auditable
  belongs_to :sclass
  belongs_to :student
  belongs_to :fee_category
  has_many :student_payment_details

  def fee_category_balance
    total_fee = self.amount * self.total_months
    total_concession = self.concession * self.total_months
    return (total_fee.round(2) - total_concession.round(2)).round(2)
  end
end
