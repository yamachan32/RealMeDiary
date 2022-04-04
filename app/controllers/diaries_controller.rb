class DiariesController < ApplicationController
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :today_data


  def index
    if user_signed_in?
      @diary_count = Diary.where(user_id: current_user.id).where(diary_date: Date.today).count
      @diaries = current_user.diaries.includes(:user)
    end
  end


  def show
    @diary = Diary.find(params[:id])
  end


  def new
    @diary = Diary.new
  end


  def create
    @diary = Diary.new(diary_params)
    if user_signed_in?
      @diary_count = Diary.where(user_id: current_user.id).where(diary_date: Date.today).count
    end
    if @diary.valid?
      if @diary_count < 1
        @diary.save
        flash[:notice] = "記録完了！"
        redirect_to user_path(current_user)
      else
        flash.now[:notice] = "※日記は1日1つまで"
        render :new
      end
    else
      render :new
    end
  end


  def edit
    @diary = Diary.find(params[:id])
  end


  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary)
      flash[:notice] = "編集完了！"
    else
      render :edit
    end
  end


  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to user_path(current_user)
  end


  private
  def diary_params
    params.require(:diary).permit(:diary_date, :title, :text, images:[]).merge(user_id: current_user.id)
  end

  def move_to_index
    @diary = Diary.find(params[:id])
    if user_signed_in? && (current_user.id != @diary.user_id)
      redirect_to action: :index
    end
  end

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
