class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to [@topic, @post]
    else
      flash.now[:error] = 'Comment could not be saved, please try again'
      render 'posts/show'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end