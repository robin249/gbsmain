class User < ApplicationRecord
  include Auditable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  ADMIN, SUPERVISOR, CLERK, STAFF, TEACHER =
      'admin', 'supervisor', 'clerk', 'staff', 'teacher'

  ROLES = [ ADMIN, SUPERVISOR, CLERK, STAFF, TEACHER].freeze
  TEACHER_ROLE = [TEACHER].freeze

  belongs_to :institute, optional: true

  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_id", optional: true

  def self.current=(user)
    Thread.current[:current_user] = user
  end

  def self.current
    Thread.current[:current_user]
  end
end
