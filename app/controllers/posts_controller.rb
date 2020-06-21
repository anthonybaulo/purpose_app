class PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:alert] = "Post created"
      redirect_to posts_path
    else
      flash[:error] = "Post was not created"
      render 'new'
    end    
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
