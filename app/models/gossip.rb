class Gossip < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags
  #chercher validates nombre de careactère
  validates :title, presence: true, length: {in: 3..40}
  validates :content, presence: true
  validates :user_id, presence: true
end
