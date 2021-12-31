class Institute < ApplicationRecord
  include Auditable

  has_many :users
  has_many :sclasses
  has_many :students
  has_many :fee_categories
  has_many :subjects
  has_many :documents

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true
end
