class RiddlesController < ApplicationController
  def new
  end

  def index
    @riddles = Riddle.all
  end

  def all
    @riddles = Riddle.all
    respond_to do |format|
      format.html
      format.json { render json: @riddles, root: false}
  end


  def destroy
  end

  def create
  end

  def update
  end
end
