class StatusesController < ApplicationController
  before_action :current_user_must_be_status_user, only: [:edit, :update, :destroy] 

  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  def index
    @q = Status.ransack(params[:q])
    @statuses = @q.result(:distinct => true).includes(:game, :user).page(params[:page]).per(10)
  end

  # GET /statuses/1
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)

    if @status.save
      message = 'Status was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @status, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /statuses/1
  def update
    if @status.update(status_params)
      redirect_to @status, notice: 'Status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.destroy
    message = "Status was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to statuses_url, notice: message
    end
  end


  private

  def current_user_must_be_status_user
    set_status
    unless current_user == @status.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:game_id, :user_id, :status)
    end
end
