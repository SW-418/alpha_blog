class ArticlesController < ApplicationController
    before_action :find_and_set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end
 
    def new
        @article = Article.new()
    end

    def create
        @article = Article.new(extract_article_params)
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @article.update(extract_article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'new'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article was deleted successfully."
        redirect_to articles_path
    end

    private
    def find_and_set_article
        @article = Article.find(params[:id])
    end

    def extract_article_params
        params.require(:article).permit(:title, :description)
    end
end
