class CommentsController < ApplicationController
  before_action :require_logged_in

  # def new
  #
  # end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = params[:link_id]
    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash.now[:errors] = @comment.errors.full_messages
    end

  end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def index
  # end
  #
  # def show
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
