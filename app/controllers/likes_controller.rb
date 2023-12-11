class LikesController < ApplicationController
    def create
        like = current_user.likes.create(diet_id: params[:diet_id])
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        like = Like.find_by(diet_id: params[:diet_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end
end
