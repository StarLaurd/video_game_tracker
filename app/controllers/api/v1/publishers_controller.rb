class Api::V1::PublishersController < Api::V1::GraphitiController
  def index
    publishers = PublisherResource.all(params)
    respond_with(publishers)
  end

  def show
    publisher = PublisherResource.find(params)
    respond_with(publisher)
  end

  def create
    publisher = PublisherResource.build(params)

    if publisher.save
      render jsonapi: publisher, status: :created
    else
      render jsonapi_errors: publisher
    end
  end

  def update
    publisher = PublisherResource.find(params)

    if publisher.update_attributes
      render jsonapi: publisher
    else
      render jsonapi_errors: publisher
    end
  end

  def destroy
    publisher = PublisherResource.find(params)

    if publisher.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: publisher
    end
  end
end
