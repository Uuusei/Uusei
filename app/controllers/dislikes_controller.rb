class DislikesController < ApplicationController
       def create
        dislike = current_user.dislikes.create(work_id: params[:work_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        dislike = Dislike.find_by(work_id: params[:work_id], user_id: current_user.id)
        dislike.destroy
        redirect_back(fallback_location: root_path)
      end 
end
