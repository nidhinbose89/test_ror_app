class CommentsController < ApplicationController

    http_basic_authenticate_with name: "cupcake", password: "storm", only: :destroy

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    # def index
    #     @article = Article.find(params[:article_id])
    #     @comments = @article.comments.all
    #     redirect_to article_comments_path(@comments)
    # end

    # def show
    #     @article = Article.find(params[:article_id])
    #     @comment = @article.comments.find(params[:id])
    #     redirect_to article_comment_path(@comment)
    # end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    # private methods for CommentsController
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end

end
