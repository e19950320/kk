class GroupsController < ApplicationController
	def index
        @groups = Group.all
		 flash[:notice] = "早安！美芝城！"
		 flash[:alert] = "晚安！吃宵夜了！"
		 flash[:warning] = "這是 warning 訊息！"
    end

    def show
        @group = Group.find(params[:id])
        @posts = @group.posts
    end

    def new
         @group = Group.new
    end
  
    def edit
        @group = Group.find(params[:id])
    end

    def create
         @group = Group.create(group_params)

        if @group.save
          redirect_to groups_path
        else
          render :new
        end
    end

    def updat
        @group = Group.find(params[:id])

        if @group.update(group_params)
         redirect_to groups_path, notice: "人生總是修修改改"
        else
         render :edit
        end
    end

    def destroy
         @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "就像青春回不去了"
    end
    
    private
  
    def group_params 
      params.require(:group).permit(:title, :description)
    end
end
