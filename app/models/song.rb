class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates_uniqueness_of :title, scope: [:artist_name, :release_year]
    validate :check_release_year

    private

    def check_release_year
        if released.present? && !release_year.present?
            errors[:release_year] << "Released songs must have a release year"
        end
        if released.present? && release_year.present? && release_year > Time.now.year
            errors[:release_year] << "Release year cannot be in the future"
        end

    end
end
