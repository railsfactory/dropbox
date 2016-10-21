class GalleryFilesController < ApplicationController

  before_action :set_gallery, only: [:show, :update, :destroy]

  # GET /galleries
  def index
    redirect_to galleries_path
  end

  # GET /galleries/1
  def show
    render json: @gallery
  end

  # POST /galleries
  def new
    new_param = params[:type] ? {type: params[:type]} : {}
    @gallery = Gallery.new(new_param)
  end

  # POST /galleries
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|

      if (@gallery.save)
        format.html { redirect_to galleries_path, success: 'Email template was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @email_template }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: 300 }
      end
    end

  end

  # PATCH/PUT /galleries/1
  def update
    if @gallery.update(gallery_params)
      redirect_to galleries_path
    else
      render json: @gallery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /galleries/1
  def destroy
    @gallery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_params
      params.require(:gallery_file).permit(:parent_id, :type, :name, :visible, :icon_url, :url, :mime_type, :name_search, :position, :asset, :user_id)
    end
end
