class User < ApplicationRecord
  has_one_attached :avatar

  has_many :event_users
  has_many :events, through: :event_users
  has_many :photos
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :event_categories
  has_many :categories, through: :event_categories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :phone_number, presence: true
end
