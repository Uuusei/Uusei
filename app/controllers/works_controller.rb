class WorksController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create]

    def top
    end

    def index
        @works = Work.all
        
        if params[:tag_ids]
          @works = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_works = Tag.find_by(name: key).works
              @works = @works.empty? ? tag_works : @works & tag_works
            end
          end
        end
  
        if params[:tag]
          Tag.create(name: params[:tag])
        end
    end

    def calender
      @works = Work.all
        
        if params[:tag_ids]
          @works = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_works = Tag.find_by(name: key).works
              @works = @works.empty? ? tag_works : @works & tag_works
            end
          end
        end

        if params[:tag]
          Tag.create(name: params[:tag])
        end
    end


    def new
        @work = Work.new
     end
    
      def create
        work = Work.new(work_params)
    
        work.user_id = current_user.id
    
        if work.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @work = Work.find(params[:id])
        @nocomments = @work.nocomments
        @nocomment = Nocomment.new
      end

      def edit
        @work = Work.find(params[:id])
      end

      def update
        work = Work.find(params[:id])
        if work.update(work_params)
          redirect_to :action => "show", :id => work.id
        else
          redirect_to :action => "new"
        end
    end

      def destroy
            work = Work.find(params[:id])
            work.destroy
            redirect_to action: :index
      end
      
    
      private
      def work_params
        params.require(:work).permit(:exercise, :menu, :photo, :start_time, tag_ids: [])
      end

      def tag
      end


    end