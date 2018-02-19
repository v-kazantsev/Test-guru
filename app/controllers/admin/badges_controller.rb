class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]
  def index
    @badges = Badge.all
  end
  def new
    @badge = Badge.new
  end
  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new, alert: t('fail')
    end
  end
  def show
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :edit, alert: t('fail')
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('success')
  end

  private
  def badge_params
    params.require(:badge).permit(:name, :main_img)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
