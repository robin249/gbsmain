class StudentDocument < ApplicationRecord
  belongs_to :student
  belongs_to :document

  mount_uploaders :attachments, AttachmentUploader
end
