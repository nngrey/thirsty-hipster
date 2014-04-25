class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_path)
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  private
  def comment_path
    params.require(:comment).permit(:comment, :user_id, :location_id)
  end
end
