class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    a = slug.split("-")
    first_word = a[0]
    second_word = a[1]
    first_letter = a[0][0].upcase
    second_letter = a[1][0].upcase
    name = first_letter + first_word.slice(1..-1) + " " + second_letter + second_word.slice(1..-1)
    self.find_by_name(name)
  end
end
