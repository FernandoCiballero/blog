class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  ONLY_LETTERS_REGEXP = /\A[a-zA-Z]+\z/
  NO_BLANKSPACES_REGEXP = /\A[^\s]+\z/

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum:5}, 
            format: { with: ONLY_LETTERS_REGEXP, message: "only allows letters" }
  validates :text, presence: true, length: {minimum:5}, 
            format: { with: ONLY_LETTERS_REGEXP, message: "only allows letters" }
  validates :image_url, presence: true, length: {minimum:5}, 
            format: { with: NO_BLANKSPACES_REGEXP, message: "not allows white spaces" }
end
