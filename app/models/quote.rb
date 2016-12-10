class Quote < ApplicationRecord
  belongs_to :author

  validates :quote, presence: true
  validates :author, presence: true
end
