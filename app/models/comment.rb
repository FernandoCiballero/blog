class Comment < ApplicationRecord
  belongs_to :article
  ONLY_LETTERS_REGEXP = /\A[a-zA-Z]+\z/

  validates :commenter, presence: true, length: {minimum:5}, 
            format: { with: ONLY_LETTERS_REGEXP, message: "only allows letters" }
  validates :body, presence: true, length: {minimum:5}, 
            format: { with: ONLY_LETTERS_REGEXP, message: "only allows letters" }
end
