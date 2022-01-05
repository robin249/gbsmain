class StudentSubject < ApplicationRecord
  belongs_to :sclass
  belongs_to :student
  belongs_to :subject
end
