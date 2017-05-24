class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  before_action :admin_only_access, except: [:show, :home]
  before_action :admin_guest_access, except: [:home]
  include ApplicationHelper

  def index
    @galleries = Gallery.all
  end

  def show
    @pictures = Picture.where(gallery_id: @gallery.id)
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def home
    @pictures = Picture.limit(8).order("RANDOM()")
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id

    respond_to do |format|
      if @gallery.save
        if params[:images]
            params[:images].each { |image|
              @gallery.pictures.create(image: image, user_id: current_user.id, gallery_id: @gallery.id)
            }
          end
          @gallery.create_activity key: 'gallery.created', owner: @gallery
        format.html { redirect_to gallery_url(@gallery), notice: 'Gallery was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @gallery.updated_by = "#{current_user.first_name} #{current_user.last_name}"

    respond_to do |format|
      if @gallery.update(gallery_params)
          @gallery.create_activity key: 'gallery.updated', owner: @gallery
          if params[:images]
            params[:images].each { |image|
              @gallery.pictures.create(image: image, user_id: current_user.id, gallery_id: @gallery.id)
            }
          end
        format.html { redirect_to gallery_url(@gallery), notice: 'Gallery was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find_by(name: params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:name, :date, :description, :created_by, :updated_by, :user_id)
    end
end
