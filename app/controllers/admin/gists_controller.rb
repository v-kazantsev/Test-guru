class Admin::GistsController < ApplicationController
  layout 'admin'
  before_action :set_gist, only: [:destroy]
  def index
    @gists = Gist.all
  end
  def destroy
    @gist.delete
    redirect_to admin_gists_path
  end
  private
  def set_gist
    @gist = Gist.find(params[:id])
  end
end
