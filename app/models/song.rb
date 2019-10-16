class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, presence: true, if: :released
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
        message: "can't be released twice in a single year"
      }
    validate :release_year_cannot_be_in_the_past
 
  def release_year_cannot_be_in_the_past
    if release_year.present? && release_year > DateTime.now.year
      errors.add(:release_year, "can't be in the past")
    end
  end

end
