class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  def index
    sort = params[:sort] || 'created_at DESC'
    category = params[:category] || 'title'
    search_text = params[:search_text] || ''
    page = params[:page] || 1
    limit = params[:limit] || 10
  
    @posts = Post.order(sort).where(category + " LIKE ?", category == "title" ? "%#{params[:search_text]}%" : params[:search_text])
    # TODO : max_page 추가
    # max_page = (@posts.length() / limit.to_i).floor + 1
    
    @pagy, @posts = pagy(@posts, items: limit)

    render json: @posts, only: [:id, :title, :content, :writer]
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    render json: @posts
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :writer)
    end
end
