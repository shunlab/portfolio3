class CommentsController < ApplicationController


  def create
    @dish = Dish.find(params[:dish_id])
    @user = @dish.user
    @comment = @dish.comments.build(user_id: current_user.id, content: params[:comment][:content])
    if !@dish.nil? && @comment.save
      flash[:success] = "コメントを追加しました"
    else
      flash[:denger] = "からのコメントは投稿できません"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
  end
end
