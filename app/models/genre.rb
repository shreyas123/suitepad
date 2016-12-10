class Genre < ApplicationRecord

  validates :genre_type, presence: true, uniqueness: { case_sensitive: false }
end
