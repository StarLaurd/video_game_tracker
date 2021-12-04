class Api::V1::DevelopersController < Api::V1::GraphitiController
  def index
    developers = DeveloperResource.all(params)
    respond_with(developers)
  end

  def show
    developer = DeveloperResource.find(params)
    respond_with(developer)
  end

  def create
    developer = DeveloperResource.build(params)

    if developer.save
      render jsonapi: developer, status: 201
    else
      render jsonapi_errors: developer
    end
  end

  def update
    developer = DeveloperResource.find(params)

    if developer.update_attributes
      render jsonapi: developer
    else
      render jsonapi_errors: developer
    end
  end

  def destroy
    developer = DeveloperResource.find(params)

    if developer.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: developer
    end
  end
end
