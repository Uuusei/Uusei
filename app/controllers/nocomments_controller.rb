class NocommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        work = Work.find(params[:work_id])
        nocomment = work.nocomments.build(nocomment_params) #buildを使い、contentとtweet_idの二つを同時に代入
        nocomment.user_id = current_user.id
        if nocomment.save
          flash[:success] = "コメントしました"
          redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        else
          flash[:success] = "コメントできませんでした"
          redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        end
      end
    
        private
        def nocomment_params
          params.require(:nocomment).permit(:content)
        end
end
