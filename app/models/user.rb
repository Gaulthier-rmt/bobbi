class User < ApplicationRecord
  has_one_attached :avatar

  has_many :events, through: :event_users
  has_many :photos
  has_many :groups
  has_many :event_groups, through: :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :phone_number, presence: true
end
