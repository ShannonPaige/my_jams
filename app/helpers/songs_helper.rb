module SongsHelper
  def song_params
    params.require(:song).permit(:title, :artist, :category_id)
  end
end
