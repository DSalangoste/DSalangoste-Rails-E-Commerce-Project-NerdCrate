class Page < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, if: -> { slug.blank? }

  def self.find_by_slug(slug)
    find_by(slug: slug.downcase)
  end

  private

  def generate_slug
    self.slug = title.to_s.parameterize
  end
end 