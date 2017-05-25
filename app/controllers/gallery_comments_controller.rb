class GalleryCommentsController < ApplicationController
  before_action :set_gallery_comment, only: [:show, :edit, :update, :destroy]

  # GET /gallery_comments
  # GET /gallery_comments.json
  def index
    @gallery_comments = GalleryComment.all
  end

  # GET /gallery_comments/1
  # GET /gallery_comments/1.json
  def show
  end

  # GET /gallery_comments/new
  def new
    @gallery_comment = GalleryComment.new
  end

  # GET /gallery_comments/1/edit
  def edit
  end

  # POST /gallery_comments
  # POST /gallery_comments.json
  def create
    @gallery_comment = GalleryComment.new(gallery_comment_params)

    respond_to do |format|
      if @gallery_comment.save
        format.html { redirect_to @gallery_comment, notice: 'Gallery comment was successfully created.' }
        format.json { render :show, status: :created, location: @gallery_comment }
      else
        format.html { render :new }
        format.json { render json: @gallery_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallery_comments/1
  # PATCH/PUT /gallery_comments/1.json
  def update
    respond_to do |format|
      if @gallery_comment.update(gallery_comment_params)
        format.html { redirect_to @gallery_comment, notice: 'Gallery comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery_comment }
      else
        format.html { render :edit }
        format.json { render json: @gallery_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_comments/1
  # DELETE /gallery_comments/1.json
  def destroy
    @gallery_comment.destroy
    respond_to do |format|
      format.html { redirect_to gallery_comments_url, notice: 'Gallery comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_comment
      @gallery_comment = GalleryComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_comment_params
      params.require(:gallery_comment).permit(:comment_entry, :user_id, :gallery_id)
    end
end
