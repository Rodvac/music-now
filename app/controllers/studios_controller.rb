class StudiosController < ApplicationController

  def index
    @studios = Studio.All
  end

  def show
    @studio = Studio.find(params[:id])
  end

end
