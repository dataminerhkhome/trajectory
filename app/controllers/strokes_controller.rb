class StrokesController < ApplicationController
  
  # get /strokes
  def index
    @strokes=Stroke.all
  end
  
end
