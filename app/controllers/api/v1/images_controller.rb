class API::V1::ImagesController < ApplicationController

	before_action :authenticate
  before_action :validate_content_type, only: :create
	before_action :set_user

	# GET /users/1/images
  def index
  	render json: @user.images.without_data
  end
  
  # GET /users/1/images/1
  def show
  	@image = Image.find(params[:id])
  	send_data @image.data, type: @image.format, disposition: :inline
  end

  # POST /users/1/images
  def create
    @image = Image.new(
      user: @user, 
      data: request.body.read, 
      size: request.body.length,
      format: request.content_type
    )
    if @image.save
      render json: @image, status: :created, location: [:api,:v1,@user,@image]
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1/images/1
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render nothing: true, status: :no_content
  end
  
  private

	  def set_user
    	@user = User.find(params[:user_id])
	  end

    def validate_content_type
      unless [Mime::JPEG, Mime::PNG].include? request.content_type
        render nothing: true, status: :unsupported_media_type 
      end
    end
end