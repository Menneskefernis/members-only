class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post.user_id = @current_user.id
    if @post.save
      redirect_to root_url
    end
  end

  def index
    @posts = Post.all
  end

  private
    def user_params
      params.require(:post).permit(:title, :body)
    end
end
