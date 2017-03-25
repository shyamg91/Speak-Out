class PostsController < ApplicationController
  def new
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end
  
  def show
    @post = Post.find(params[:id])
  end
  def index
    @posts = Post.all
  end
  def upvote
    Post.increment_counter(:votes, params[:id])
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:message, :votes)
  end
end
