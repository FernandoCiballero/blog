class ArticlesController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all.order("created_at DESC")
    @categories = Category.all.order("created_at DESC")
  end

  def new
    #@article = Article.new
    @article = current_user.articles.build
  end

  def show
    @categories = Category.all.order("created_at DESC")
  end

  def create
    #@article = Article.new(article_params)
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image_url, :category_id)
  end
end
