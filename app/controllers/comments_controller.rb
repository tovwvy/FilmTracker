class CommentsController < ApplicationController
    def create
      @film = Film.find(params[:film_id])
      @comment = @film.comments.create(comment_params.merge(user: current_user))
      redirect_to @film
    end

    def edit
      @comment = Comment.find(params[:id])
      @film = Film.find(params[:film_id])
  
      unless @comment.editable_by?(current_user)
        redirect_to @comment.film, alert: "You are not authorized to edit this comment."
      end
    end
  
    def update
      @comment = Comment.find(params[:id])
  
      unless @comment.editable_by?(current_user)
        redirect_to @comment.film, alert: "You are not authorized to edit this comment."
        return
      end
  
      if @comment.update(comment_params)
        redirect_to @comment.film, notice: "Comment was successfully updated."
      else
        render :edit
      end
    end
    
    
      
      private
      
      def authorize_user
        @comment = Comment.find(params[:id])
        redirect_to film_path(@comment.film), alert: "You are not authorized to perform this action." unless @comment.user == current_user
      end
    
      def comment_params
        params.require(:comment).permit(:content)
      end
      
end
