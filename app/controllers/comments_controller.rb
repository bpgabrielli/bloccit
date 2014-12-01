class CommentsController < ApplicationController
  respond_to :html, :js

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
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
     flash[:notice] = "Comment was removed."
    else
     flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post]}
    end
  end
  
private

  def comment_params
    params.require(:comment).permit(:body)
  end

end