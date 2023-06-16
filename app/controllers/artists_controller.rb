class ArtistsController < ApplicationController
  def index
    artists = Artist.all
    if artists.empty?
      render json: {
        message: "Artists Not Found",
        artists: []
      }, status: :not_found
    else
      render json: {
        message: "Artists Found",
        artists: artists
      }, status: :ok
    end
  end

  def show
    artist = set_artist
    if artist
      render json: {
        message: "Artists Found",
        artist: artist 
      }, status: :ok
    else
      render json: {
        message: "Artists Not Found",
        error: artist.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  def create
    artist = Artist.create(artist_params)
    if artist.save?
      render json: {
        message: "Artist Created Successfully",
        artist: artist
      }, status: :created
    else
      render json: {
        message: "Artist Unable to Created",
        error: artist.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  def update
    artist = set_user
    if artist.update(artist_params)
      render json: {
        message: "Artist Updated Successfully",
        artist: artist
      }, status: :ok
    else
      render json: {
        message: "Artist Unable to Update",
        error: artist.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  def destroy
    artist = set_artist
    if artist.delete
      render json: {
        message: "Artist Deleted Successfully",
        artist: artist
      }, status: :ok
    else
      render json: {
        message: "Artist Unable to Delete",
        error: artist.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  private
  def set_artist
    artist = Artist.find_by(id: params[:id])
    if artist
      return artist
    end
  end

  def artist_params
    params.require(:artist).permit(:celebname, :genre, :production, :music, :image)
  end
end
