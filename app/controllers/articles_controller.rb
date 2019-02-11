class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article= Article.find(params[:id])
    @category_list = @article.categories.pluck(:name).join(",")
  end

  # POST /articles
  # POST /articles.json
  def create
    @article= current_user.articles.build(article_params)
    category_list = params[:tag].split(",")
    if @article.save
      @article.save_categories(category_list)
      flash[:success] = "記事を作成しました"
      redirect_to articles_url
    else
      render 'articles/new'
    end

    # @article = Article.new(article_params)

    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article= Article.find(params[:id])
    category_list = params[:tag].split(",")
    if @article.update_attributes(article_params)
      @article.save_categories(category_list)
      flash[:success] = "記事を更新しました"
      redirect_to articles_url
    else
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :tag)
    end
end
