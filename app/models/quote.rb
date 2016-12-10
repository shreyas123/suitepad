class Quote < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :quote, presence: true
  validates :author, presence: true

  scope :random, -> { self.offset(rand(self.count)).first }

  delegate :name, to: :author, prefix: true

  def genre_type
    genre.try(:genre_type) || 'nature'
  end

  def as_json(options = {})
    default_options = { only: [:quote], methods: [:genre_type, :author_name] }
    super(options.merge(default_options))
  end
end
