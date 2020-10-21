module Api
  module V1
    class ArticlesController < ApiController

      def index
        articles = Article.all
        render json: {status: 'Success', message: 'Loaded articles', data: articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'Success', message: 'Loaded article', data: article}, status: :ok
      end

      def create
        article = Article.new(article_params)
        if article.save
          render json: {status: 'Success', message: 'new article has been created', data: article}, status: :ok
        else
          render json: {status: 'Error', message: 'article has not been saved', data: article.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'Success', message: 'article has been removed', data: article}, status: :ok
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: 'Success', message: 'article has been updated', data: article}, status: :ok
        else
          render json: {status: 'Error', message: 'article has not been updated', data: article.errors}, status: :unprocessable_entity
        end
      end

      private
      def article_params
        params.permit(:title, :body)
      end
    end
  end
end