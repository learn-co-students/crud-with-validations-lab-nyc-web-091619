require 'date'
class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, acceptance: { accept: [true, false] }
  validates :artist_name, presence: true
  # validates :release_year

  validate :optional_release_year


  def optional_release_year
    if self.released
      if !self.release_year
        self.errors.add(:release_year, "If released, release year must be specified")
      elsif Time.now.year < self.release_year
        self.errors.add(:release_year, "Release year cannot be a future year if song is released")
      end
    end
  end

end
