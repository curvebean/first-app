class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates_uniqueness_of :user_name
  validates_presence_of :user_name
  has_many :posts
  has_many :follows_from, class_name: Friend, foreign_key: :from_id, dependent: :destroy
  has_many :follows_to,   class_name: Friend, foreign_key: :to_id,   dependent: :destroy
  has_many :following, through: :follows_from, source: :to
  has_many :followed,  through: :follows_to,   source: :from
end
