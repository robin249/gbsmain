class Subject < ApplicationRecord
  include Auditable

  belongs_to :institute
  belongs_to :sclass

  has_many :student_subjects
  has_many :students, through: :student_subjects

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true
end
