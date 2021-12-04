class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update, :destroy]

  # GET /video_games
  def index
    @q = VideoGame.ransack(params[:q])
    @video_games = @q.result(:distinct => true).includes(:ratings, :statuses, :notes, :publisher, :developer, :rating).page(params[:page]).per(10)
  end

  # GET /video_games/1
  def show
    @note = Note.new
    @status = Status.new
    @rating = Rating.new
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
      message = 'VideoGame was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @video_game, notice: message
      end
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
    message = "VideoGame was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to video_games_url, notice: message
    end
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
