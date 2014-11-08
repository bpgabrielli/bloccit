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

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
     flash[:notice] = "Comment was removed."
     redirect_to [@topic, @post]
    else
     flash[:error] = "Comment couldn't be deleted. Try again."
     redirect_to [@topic, @post]
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

end