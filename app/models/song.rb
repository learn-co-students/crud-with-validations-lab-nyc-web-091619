class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false] }
    validates :artist_name, presence: true
    validates :title, uniqueness: {
        scope: [:artist_name, :release_year]
    }
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











# def song_same_in_a_year
#     valid = false
#     Song.all.select do |song_a, song_b| 
#         if song_a.title == song_b.title
#             if (song_b.release_year + 1 <= song_a.release_year) && (song_a.release_year >= song_b.release_year - 1)
#                valid = true
#             end
#         else
#             false
#         end
#     end
#     if valid == true
#         errors.add(:title, "can't release same song twice in a year")
#     else
#         false
#     end
# end