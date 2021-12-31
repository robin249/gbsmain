class Sclass < ApplicationRecord
  include Auditable
  belongs_to :institute
  has_many :students

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true

end
