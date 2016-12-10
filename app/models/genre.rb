class Genre < ApplicationRecord
  has_many :quotes

  validates :genre_type, presence: true, uniqueness: { case_sensitive: false }
end
