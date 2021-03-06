class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "rabbit", 
    password: "carrot", except: [:index, :show]
    
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new -> new article page
  def new
    @article = Article.new
  end

  # GET /articles/:id/edit -> edit article page
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles handler
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # PUT PATCH /articles/:id handler
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # DELETE /articles/:id handler
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
