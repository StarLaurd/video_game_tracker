class Api::V1::RatingsController < Api::V1::GraphitiController
  def index
    ratings = RatingResource.all(params)
    respond_with(ratings)
  end

  def show
    rating = RatingResource.find(params)
    respond_with(rating)
  end

  def create
    rating = RatingResource.build(params)

    if rating.save
      render jsonapi: rating, status: 201
    else
      render jsonapi_errors: rating
    end
  end

  def update
    rating = RatingResource.find(params)

    if rating.update_attributes
      render jsonapi: rating
    else
      render jsonapi_errors: rating
    end
  end

  def destroy
    rating = RatingResource.find(params)

    if rating.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: rating
    end
  end
end
