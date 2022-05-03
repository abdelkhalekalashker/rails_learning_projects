class AdminController < ApplicationController
  def index
    
  end

  def posts
    @posts = Post.all.includes(:posts,:applications)
  end

  def comments
  end

  def users
  end

  def show_post
    @post = Post.find.includes(:posts , :applications).find(params[:id])
  end

  def delete_post
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root_path
  end
end
