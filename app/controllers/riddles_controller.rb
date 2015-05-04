class RiddlesController < ApplicationController
  def new
  end

  def index
    @riddles = Riddle.all
  end

  def destroy
  end

  def create
  end

  def update
  end
end
