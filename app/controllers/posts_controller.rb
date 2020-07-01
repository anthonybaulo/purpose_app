class PostsController < ApplicationController

  def index
    @posts = current_user.posts.paginate(page: params[:page])
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

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:alert] = "Post updated"
      redirect_to posts_path
    else
      flash[:error] = "Post was not updated"
      render 'edit'
    end
  end
  
  def destroy 
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:alert] = "Post deleted" 
      redirect_to posts_path
    else
      flash[:error] = "Post was not deleted"
      render 'index'
    end
  end

  def public
    @posts = Post.where("user_id != ? AND public = true", current_user.id)
                 .paginate(page: params[:page])
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
