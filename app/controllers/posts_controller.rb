class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.create params[:post]
    redirect_to '/posts'
  end

  def new
    @post = Post.new
  end
  


end
