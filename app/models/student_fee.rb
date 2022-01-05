class StudentFee < ApplicationRecord
  include Auditable
  belongs_to :sclass
  belongs_to :student
  belongs_to :fee_category
end
