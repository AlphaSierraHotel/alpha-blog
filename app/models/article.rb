class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 50 }
  validates :description, presence: true, length: {minimum: 8, maximum: 300 }
end
