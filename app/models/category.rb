class Category < ApplicationRecord
  has_many :articles
  ONLY_LETTERS_REGEXP = /\A[a-zA-Z]+\z/

  validates :name, presence: true, length: {minimum:5}, 
            format: { with: ONLY_LETTERS_REGEXP, message: "only allows letters" }
  validates :description, presence: true, length: {minimum:5}, 
            format: { with: ONLY_LETTERS_REGEXP, message: "only allows letters" }
  validates :display, presence: true
end
