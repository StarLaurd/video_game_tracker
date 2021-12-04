class RatingsController < ApplicationController
  before_action :set_rating, only: %i[show edit update destroy]

  def index
    @q = Rating.ransack(params[:q])
    @ratings = @q.result(distinct: true).includes(:game, :user,
                                                  :video_games).page(params[:page]).per(10)
  end

  def show
    @video_game = VideoGame.new
  end

  def new
    @rating = Rating.new
  end

  def edit; end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      message = "Rating was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @rating, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @rating.update(rating_params)
      redirect_to @rating, notice: "Rating was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @rating.destroy
    message = "Rating was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ratings_url, notice: message
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:game_id, :user_id, :rating, :review)
  end
end
