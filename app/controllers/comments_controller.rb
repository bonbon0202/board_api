class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end  
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: { message: 'comment updated' }
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    render json: { message: 'comment deleted' }
  end

  private
  def set_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :writer)
  end
end
