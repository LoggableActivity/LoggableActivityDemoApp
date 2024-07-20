# frozen_string_literal: true

class User < ApplicationRecord
  include LoggableActivity::Hooks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :demo_address, class_name: 'Demo::Address', optional: true, inverse_of: :users
  belongs_to :demo_club, class_name: 'Demo::Club', optional: true, inverse_of: :users
  has_many :patient_journals, class_name: 'Demo::Journal', foreign_key: 'patient_id', dependent: :nullify, inverse_of: :patient
  has_many :doctor_journals, class_name: 'Demo::Journal', foreign_key: 'doctor_id', dependent: :nullify, inverse_of: :doctor
  has_one :demo_user_profile, class_name: 'Demo::UserProfile', dependent: :destroy
  accepts_nested_attributes_for :demo_user_profile
  enum user_type: { Patient: 0, Doctor: 1, Admin: 2 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
