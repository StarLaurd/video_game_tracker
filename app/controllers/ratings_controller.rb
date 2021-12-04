class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  def index
    @q = Rating.ransack(params[:q])
    @ratings = @q.result(:distinct => true).includes(:game, :user, :video_games).page(params[:page]).per(10)
  end

  # GET /ratings/1
  def show
    @video_game = VideoGame.new
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      message = 'Rating was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @rating, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /ratings/1
  def update
    if @rating.update(rating_params)
      redirect_to @rating, notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ratings/1
  def destroy
    @rating.destroy
    message = "Rating was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to ratings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rating_params
      params.require(:rating).permit(:game_id, :user_id, :rating, :review)
    end
end
