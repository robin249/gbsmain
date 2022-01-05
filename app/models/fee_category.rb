class FeeCategory < ApplicationRecord
  include Auditable

  belongs_to :institute
  has_many :class_fees
  has_many :sclasses, through: :class_fees

  has_many :student_fees
  has_many :students, through: :student_fees

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true

  enum billing_term: { anually: 0, monthly: 1, quarterly: 2, 'semi-anually': 3}

  accepts_nested_attributes_for :class_fees

end
