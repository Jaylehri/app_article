class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: "jay", password: "lahari", except: [:index,
   :show]
   
  def index
    # @articles = Article.all
    @articles = Article.paginate(:page => params[:page],per_page: 5)
    @article = Article.new
  end
 

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article =Article.new
  end

  def edit
    # @article = Article.find(params[:id])
    # respond_to do |format|
    #   format.js
    # format.html { render @article }
    # end
  end

  def create
   # @article = Article.all
    @article = Article.new(article_params)
   # @aritlce.user_id = current_user.id 
    respond_to do |format|
      if @article.save 
        format.js 
        # format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        # format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :index }
      end
    end
    # if @article.save
    #   redirect_to @article
    # else
    # #redirect_to '/articles/new'
    #   render 'new'
    # end
  end

  def update
    # @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
    # respond_to do |format|

    #   if @article.update(article_params)
    #     format.js
    #     format.html { redirect_to @article }
    #   else
    #    format.html { render 'edit' }
    #   end
    # end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
     respond_to do |format|   
       format.html { redirect_to article_url }
       format.js   { render :layout => false }   
     end
   end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text,:image,:email)
  end

end
