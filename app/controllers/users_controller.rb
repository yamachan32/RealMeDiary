class UsersController < ApplicationController
  before_action :today_data

  def show
    if user_signed_in?
      @diary_count = Diary.where(user_id: current_user.id).where(diary_date: Date.today).count
    end
    @user = User.find(params[:id])
    @diaries = @user.diaries.includes(:user)
  end

  
  private
  def today_data
    @diaries = Diary.includes(:user)
    @datas = []
    @diaries.each do |diary|
      diary_jst = diary[:diary_date].in_time_zone('Tokyo')
      if (diary_jst.to_s.match(/#{Date.today.to_s}.+/)) 
        @datas << diary
      end
    end
  end
end
