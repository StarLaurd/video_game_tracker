class PlatformsController < ApplicationController
  before_action :set_platform, only: %i[show edit update destroy]

  def index
    @q = Platform.ransack(params[:q])
    @platforms = @q.result(distinct: true).includes(:ratings).page(params[:page]).per(10)
  end

  def show
    @rating = Rating.new
  end

  def new
    @platform = Platform.new
  end

  def edit; end

  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      redirect_to @platform, notice: "Platform was successfully created."
    else
      render :new
    end
  end

  def update
    if @platform.update(platform_params)
      redirect_to @platform, notice: "Platform was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @platform.destroy
    redirect_to platforms_url, notice: "Platform was successfully destroyed."
  end

  private

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def platform_params
    params.require(:platform).permit(:name)
  end
end
