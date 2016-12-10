class Quote < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :quote, presence: true
  validates :author, presence: true

  scope :random, -> { self.offset(rand(self.count)).first }

  def genre_type
    genre.try(:genre_type) || 'nature'
  end
end
