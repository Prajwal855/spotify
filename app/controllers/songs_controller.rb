class SongsController < ApplicationController
  def index
    songs = Song.all
    if songs.empty?
      render json: {
        message: "Songs Not Found",
        songs: []
      }, status: :not_found
    else
      render json: {
        message: "Songs Found",
        songs: songs
      }, status: :ok
      end
  end


  def show
   song = set_song
   if song
    render json: {
      message: "Song Found #{song.songname} ",
      song: song
    }, status: :ok
    else
      render json: {
        message: "Song Not Found",
        error: song.errors.full_messages
      }, status: :not_found
    end
  end

  def create
    song = Song.new(song_params)
    if song.save
      render json: {
        message: "Song Created Successfully",
        song: song
      }, status: :created
    else
      render json: {
        message: "Song Not Created",
        error: song.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  def update
    song = set_song
    if song.update(song_params)
      render json: {
        message: "Song Updated Successfully",
        song: song
      }, status: :ok
    else
      render json: {
        message: "Song Cannot Be Updated",
        error: song.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  def destroy
    song = set_song
    if song.delete
      render json: {
        message: "Song Deleted Succussfully",
        song: song
      }, status: :ok
    else
      render json: {
        message: "Song  Unable to Delete",
        error: song.errors.full_messages
      }, status: :unprossessable_entity
    end
  end

  private
  def song_params
    permit.require(:song).permit(:songname, :duration, :artist_id)
  end

  def set_song
    song  Song.find_by(id: params[:id])
    if song 
      return song
    end
  end

end
