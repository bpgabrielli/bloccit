class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
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
    @post = Post.find(params[:post_id])
    @topic = @post.topic
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