class Song < ApplicationRecord
  belongs_to :artist
  has_many :favourites
  has_many :users, through: :favourites
end
