class Sclass < ApplicationRecord
  include Auditable

  belongs_to :institute
  has_many :students
  has_many :subjects
  has_many :class_fees
  has_many :fee_categories, through: :class_fees

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true

  enum session_duration: { 'April-March': 0, 'January-June': 1, 'July-December': 2}
end
