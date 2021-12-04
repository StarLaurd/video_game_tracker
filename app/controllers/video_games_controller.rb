class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update, :destroy]

  # GET /video_games
  def index
    @video_games = VideoGame.all
  end

  # GET /video_games/1
  def show
  end

  # GET /video_games/new
  def new
    @video_game = VideoGame.new
  end

  # GET /video_games/1/edit
  def edit
  end

  # POST /video_games
  def create
    @video_game = VideoGame.new(video_game_params)

    if @video_game.save
      redirect_to @video_game, notice: 'Video game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /video_games/1
  def update
    if @video_game.update(video_game_params)
      redirect_to @video_game, notice: 'Video game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /video_games/1
  def destroy
    @video_game.destroy
    redirect_to video_games_url, notice: 'Video game was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_game
      @video_game = VideoGame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_game_params
      params.require(:video_game).permit(:name, :release_date, :rating_id, :image, :publisher_id, :developer_id)
    end
end
