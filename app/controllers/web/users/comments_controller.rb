module Web::Users
  class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]

    def index
      @comments = Comment.all
    end

    def show
    end

    def new
      @comment = Comment.new
    end

    def edit
    end

    def create
      @comment = Comment.new(comment_params)

      respond_to do |format|
        if @comment.save
          format.html { redirect_to comment_url(@comment), notice: "Comment was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      end
    end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :book_id)
    end
  end
end
