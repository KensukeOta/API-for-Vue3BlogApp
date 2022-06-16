class PostsController < ApplicationController
  def index
    posts = Post.all.order(created_at: "DESC").as_json(include: [:user]).to_json
    render json: posts
  end
  
  def create
    post = Post.new(post_params)

    post.save
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update(post_params);
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
