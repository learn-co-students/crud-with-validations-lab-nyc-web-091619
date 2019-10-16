class Song < ApplicationRecord
  
  validates :title, presence: true
  validates :title, uniqueness: { 
    scope: %i[artist_name release_year]
  }
  
  validates :artist_name, presence: true
  
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
  
  # validates :release_year, numericality: {
  #   less_than_or_equal_to: Date.today.year
  # }, if: -> {
  #   :released?
  # }

  private

  def released?
    released
  end
end
