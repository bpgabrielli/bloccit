class FavoritesController < ApplicationController
   def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
     authorize favorite

     if favorite.save
      flash[:notice] = "Post favorited."
      redirect_to [@post.topic, @post]
     else
      flash[:error] = "Unable to favorite. Try again?"
      redirect_to [@post.topic, @post]
     end
   end

   def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find(params[:id])
    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Post unfavorited."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unable to unfavorite. Try once more?"
      redirect_to [@post.topic, @post]
    end
  end
end
