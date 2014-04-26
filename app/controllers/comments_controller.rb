class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @location = Location.find(params[:location_id])
    @comment = @location.comments.new
  end

  def create
    @location =Location.find(params[:location_id])
    @comment = Comment.create!(comment_params)
    respond_to do |format|
      format.html { redirect_to location_path(@location) }
      format.js
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @location = Location.find(params[:location_id])
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    respond_to do |format|
      format.html { redirect_to location_path(@location) }
      format.js
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to location_path(@location) }
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :location_id)
  end
end
