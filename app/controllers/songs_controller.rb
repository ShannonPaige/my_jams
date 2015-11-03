class SongsController < ApplicationController
  include SongsHelper

  def index
    @songs = Song.all
    session[:most_recent_song_id] = @songs.last.id if @songs.last
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "You successfully created a song"
      redirect_to songs_path
    else
      flash[:errors] = "Must enter a song and title"
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      flash[:notice] = "You successfully updated this song"
      redirect_to songs_path
    else
      flash[:errors] = @song.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
      flash[:notice] = "You successfully deleted this song"
    redirect_to songs_path
  end
end
