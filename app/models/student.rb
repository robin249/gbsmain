class Student < ApplicationRecord
  include Auditable

  belongs_to :institute
  belongs_to :sclass
  has_many :student_documents
  has_many :documents, through: :student_documents

  has_many :student_fees
  has_many :fee_categories, through: :student_fees

  has_many :student_subjects
  has_many :subjects, through: :student_subjects

  has_many :student_payments

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true

  attr_accessor :document_id
  DOCUMENTS = Document.all
  SESSION_YEAR = '2020-2021'

  def balance
    total_fee = 0
    total_concession = 0
    self.student_fees.where(active: 1).each do |student_fee|
      total_fee += student_fee.amount * student_fee.total_months
      total_concession += student_fee.concession * student_fee.total_months
    end
    return (total_fee.round(2) - total_concession.round(2)).round(2)
  end

  def total_fee
    sum = 0
    self.student_fees.where(active: 1).each do |student_fee|
      sum += student_fee.amount * student_fee.total_months
    end
    return sum.round(2)
  end

  def total_concession
    # self.student_fees.where(active: 1).sum(:amount)
    sum = 0
    self.student_fees.where(active: 1).each do |student_fee|
      sum += student_fee.concession * student_fee.total_months
    end
    return sum.round(2)
  end
end
