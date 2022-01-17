class StudentPayment < ApplicationRecord
  include Auditable
  belongs_to :sclass
  belongs_to :student
  has_many :student_payment_details

  enum payment_mode: { Cash: 0, Cheque: 1, UPID: 2}
  enum status: { Pending: 0, Complete: 1, Cancel: 2}
end
