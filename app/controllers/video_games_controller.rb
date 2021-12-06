class VideoGamesController < ApplicationController
  before_action :set_video_game, only: %i[show edit update destroy]

  def index
    @q = VideoGame.ransack(params[:q])
    @video_games = @q.result(distinct: true).includes(:ratings, :statuses,
                                                      :notes, :publisher, :developer, :platform).page(params[:page]).per(10)
  end

  def show
    @note = Note.new
    @status = Status.new
    @rating = Rating.new
  end

  def new
    @video_game = VideoGame.new
  end

  def edit; end

  def create
    @video_game = VideoGame.new(video_game_params)

    if @video_game.save
      message = "VideoGame was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @video_game, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @video_game.update(video_game_params)
      redirect_to @video_game, notice: "Video game was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @video_game.destroy
    message = "VideoGame was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to video_games_url, notice: message
    end
  end

  private

  def set_video_game
    @video_game = VideoGame.find(params[:id])
  end

  def video_game_params
    params.require(:video_game).permit(:name, :release_date, :image,
                                       :publisher_id, :developer_id, :platform_id)
  end
end
