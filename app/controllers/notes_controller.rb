class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @q = Note.ransack(params[:q])
    @notes = @q.result(distinct: true).includes(:game,
                                                :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = Note.new(note_params)

    if @note.save
      message = "Note was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @note, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: "Note was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    message = "Note was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to notes_url, notice: message
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:user_id, :game_id)
  end
end
