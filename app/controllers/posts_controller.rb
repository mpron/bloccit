class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize! :create, Post, message: "You must be a member to create posts. You shall not pass."
  end

  def create
    @post = current_user.posts.build(params[:post])
    authorize! :create, @post, message: "You need to be signed up to do that. Naughty, naughty."
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to be the author of the post to edit it.  Silly goose :)"
  end

  def update
    @post = Post.find(params[:id])
    authorize! :update, @post, message: "You need to be the author of the post to edit it.  Silly goose :)"
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

end
