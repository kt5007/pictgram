class CommentsController < ApplicationController
  def index
    @topic_comments = Comment.all.includes(:topic_id)
  end
  
  def new
    @comment = Comment.new
    #@comment.topic_id = params[:topic_id]
    @topic = Topic.find_by(params[:topic_id])
  end
  
  def create
    #@comment = Comment.new(comment_params)
    #@comment.topic_id = current_user.id
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to topics_path, success: 'コメントできました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end
