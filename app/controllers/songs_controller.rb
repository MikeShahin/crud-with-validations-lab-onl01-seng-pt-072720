class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)

        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        set_song!.destroy
        redirect_to songs_url
    end

    def set_song!
        @song = Song.find(params[:id])
    end

    private

    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end
end
