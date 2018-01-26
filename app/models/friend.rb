class Friend < ApplicationRecord
  validates :from_id,{presence: true}
  validates :to_id,{presence: true}
  belongs_to :from, class_name: User, foreign_key: :from_id
  belongs_to :to, class_name: User,   foreign_key: :to_id
end
