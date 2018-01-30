class Admin::GistsController < ApplicationController
  before_action :set_gist, only: [:show]
  def index
    @gists = Gist.all
  end
  def show
  end
  private
  def set_gist
    @gist = Gist.find(params[:id])
  end
end
