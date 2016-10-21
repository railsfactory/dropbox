class GalleriesController < ApplicationController
  
  before_filter :authenticated_user
  before_action :set_gallery, only: [:show, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  # GET /galleries
  def index
    @galleries = if params[:parent_id]
      Gallery.where(parent_id: params[:parent_id])
    else
    current_user.galleries
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  def content
    @galleries = Gallery.where(parent_id: params[:parent_id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  # GET /galleries/1
  def show
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gallery }
    end
  end

  # POST /galleries
  def new
    new_param = params[:type] ? {type: params[:type]} : {}
    @gallery = Gallery.new(new_param)
  end

  # POST /galleries
  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to galleries_path
    else
      render json: @gallery.errors, status: :unprocessable_entity
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
    @gallery.delete
    redirect_to galleries_path
  end

  def delete_items
    galleries = Gallery.where(:id => params[:ids])

    if(Gallery.count > 0)
      galleries.delete_all
    end
    redirect_to galleries_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_params
      params.require(:gallery).permit(:parent_id, :type, :name, :visible, :icon_url, :url, :mime_type, :name_search, :position, :asset, :user_id)
    end
end
