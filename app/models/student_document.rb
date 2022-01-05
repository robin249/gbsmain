class StudentDocument < ApplicationRecord
  include Auditable
  belongs_to :student
  belongs_to :document

  mount_uploaders :attachments, AttachmentUploader
end
