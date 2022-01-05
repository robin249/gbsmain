class ClassFee < ApplicationRecord
  include Auditable
  belongs_to :sclass
  belongs_to :fee_category
end
