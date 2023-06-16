class Artist < ApplicationRecord
    has_many :songs
    has_many_attached :music
    has_one_attached :profile
end
