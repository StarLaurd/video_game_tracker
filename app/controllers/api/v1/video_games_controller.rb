class Api::V1::VideoGamesController < Api::V1::GraphitiController
  def index
    video_games = VideoGameResource.all(params)
    respond_with(video_games)
  end

  def show
    video_game = VideoGameResource.find(params)
    respond_with(video_game)
  end

  def create
    video_game = VideoGameResource.build(params)

    if video_game.save
      render jsonapi: video_game, status: :created
    else
      render jsonapi_errors: video_game
    end
  end

  def update
    video_game = VideoGameResource.find(params)

    if video_game.update_attributes
      render jsonapi: video_game
    else
      render jsonapi_errors: video_game
    end
  end

  def destroy
    video_game = VideoGameResource.find(params)

    if video_game.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: video_game
    end
  end
end
