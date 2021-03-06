class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def create
		@song = Song.create(song_params(:title, :released, :release_year, :artist_name, :genre))
		if @song.valid?
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def new
		@song = Song.new
	end

	def show
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])

		if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))

	  	redirect_to song_path(@song)
	  else
	  	render :edit
	  end
	end

	def destroy
		Song.find(params[:id]).destroy
		redirect_to :songs
	end

	def edit
		@song = Song.find(params[:id])
	end


	private

	def song_params(*args)
		params.require(:song).permit(*args)
	end
end
