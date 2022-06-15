class PostsController < ApplicationController
  def index
    posts = Post.all.order(created_at: "DESC").as_json(include: [:user]).to_json
    render json: posts
  end
  
  def create
    post = Post.new(post_params)

    post.save
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
