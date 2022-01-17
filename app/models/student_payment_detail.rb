class StudentPaymentDetail < ApplicationRecord
  belongs_to :student_payment
  belongs_to :student_fee
  enum status: { Pending: 0, Complete: 1, Cancel: 2}
end
