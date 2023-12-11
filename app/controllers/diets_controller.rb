class DietsController < ApplicationController
    before_action :authenticate_user!

    def index
        @diets = Diet.all
    end

    def new
        @diet = Diet.new
      end
    
      def create
        diet = Diet.new(diet_params)
    
        diet.user_id = current_user.id 

      
        if diet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      
      def show
        @diet = Diet.find(params[:id])
        @comments = @diet.comments
        @comment = Comment.new
      end

      def edit
        @diet = Diet.find(params[:id])
      end

      def update
        diet = Diet.find(params[:id])
        if diet.update(diet_params)
          redirect_to :action => "show", :id => diet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        diet = Diet.find(params[:id])
        diet.destroy
        redirect_to action: :index
      end

      private
      def diet_params
        params.require(:diet).permit(:stretch, :result, :image)
      end
end
