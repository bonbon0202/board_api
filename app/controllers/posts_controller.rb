class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  def index
    sort = params[:sort] || 'created_at DESC'
    search_type = params[:search_type] || 'title'
    search_text = params[:search_text] || ''
    page = params[:page] || 1
    limit = params[:limit] || 10

    @posts = Post.order(sort)
    
    case search_type
    when 'title'
      @posts = @posts.where("title LIKE ?", "%#{search_text}%")
    when 'writer'
      @posts = @posts.where(writer: search_text)
    end

    @pagy, @posts = pagy(@posts, items: limit)

    render json: @posts, meta: {current_page: @pagy.page, max_page: @pagy.last }, adapter: :json, each_serializer: PostSerializer
  end

  def show
    render json: @post, serializer: DetailPostSerializer
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
      render json: { message: 'post updated' }
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    render json: { message: 'post deleted' }
  end

  private
    def set_post
      @post = Post.includes(:comments).find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :writer)
    end
end
