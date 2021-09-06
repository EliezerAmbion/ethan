class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :rating, presence: true
end
