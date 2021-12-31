class Student < ApplicationRecord
  include Auditable

  belongs_to :institute
  belongs_to :sclass
  has_many :student_documents
  has_many :documents, through: :student_documents

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true

  attr_accessor :document_id
  DOCUMENTS = Document.all
end
