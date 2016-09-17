class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_model!, except: [:index, :show]

  # Index action to render all Posts
  def index
    @posts = Post.all.order('created_at desc').paginate(:page => params[:page], :per_page => 3)
  end

  # New action to create new posts
  def new
    @post = Post.new
  end

  # Create action to save all new posts into the database
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] =  "Post created succussfully"
      redirect_to @post
    else
      flash[:alert] = "Oops!Something went wrong"
      render :new
    end
  end

  # Show action to render a post after retrieving its id
  def show
  end

  # Edit action to retrieve  a post for editing
  def edit
  end

  # Update action to update a post with new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully"
      redirect_to @post
    else
      flash[:alert] = "Oops! Something went wrong"
      render :edit
    end
  end

  # Destroy action for removing a post permanently from a database
  def destroy
    if @post.destroy
      flash[:notice] = "Post deleted successfully"
      redirect_to posts_path
    else
      flash[:alert] = "Oopps! Something went wrong"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
