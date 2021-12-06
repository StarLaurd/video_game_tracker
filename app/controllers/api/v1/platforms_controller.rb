class Api::V1::PlatformsController < Api::V1::GraphitiController
  def index
    platforms = PlatformResource.all(params)
    respond_with(platforms)
  end

  def show
    platform = PlatformResource.find(params)
    respond_with(platform)
  end

  def create
    platform = PlatformResource.build(params)

    if platform.save
      render jsonapi: platform, status: :created
    else
      render jsonapi_errors: platform
    end
  end

  def update
    platform = PlatformResource.find(params)

    if platform.update_attributes
      render jsonapi: platform
    else
      render jsonapi_errors: platform
    end
  end

  def destroy
    platform = PlatformResource.find(params)

    if platform.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: platform
    end
  end
end
