class Quote < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :quote, presence: true
  validates :author, presence: true
end
