class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create params[:comment]
    redirect_to posts_path
  end
end
