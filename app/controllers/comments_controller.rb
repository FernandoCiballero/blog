class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_comment, except: :create
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def find_comment
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
