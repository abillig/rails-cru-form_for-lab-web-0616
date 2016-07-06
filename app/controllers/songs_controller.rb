require 'pry'

class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new
    @song.name = params[:song][:name]
    @song.genre = Genre.find(params[:song][:genre_id])
    @song.artist = Artist.find(params[:song][:artist_id])
    @song.save 
    redirect_to song_path(@song)
  end

  def edit 
    @song = Song.find(params[:id])
  end

  def update 
    @song = Song.find(params[:id])
    @song.update(name: params[:song][:name])
    @song.genre = Genre.find(params[:song][:genre_id])
    @song.artist = Artist.find(params[:song][:artist_id])
    redirect_to song_path(@song)
  end

  def index
    @songs = Song.all
  end


end
