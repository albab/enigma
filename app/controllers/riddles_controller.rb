class RiddlesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

   respond_to :json

  def new
  end

  def index
    @riddles = Riddle.all
  end

  def create
    @riddle = Riddle.new
    @question = params['question']
    @answer = params['answer']
    @riddle.question = @question
    @riddle.answer = @answer
    @riddle.save
    respond_to do |format|
      format.json { render json: @riddles }
    end
  end


  def all
    @riddles = Riddle.all
    respond_to do |format|
      format.html
      format.json { render json: @riddles, root: false}
    end
  end

  def location_finder
    @lat = params['coordinates']['lat'] rescue nil
    @lon = params['coordinates']['lon'] rescue nil
    session[:lat] = @lat
    session[:lon] = @lon
    lat_and_long = @lat + ", " + @lon
  end

  def map_data
    @riddles = Riddle.all
    respond_to do |format|
      format.html
      format.json { render json: @riddles, root: false}
    end
  end

  def destroy
  end

  def create
  end

  def update
  end
end
