class StrokesController < ApplicationController
  
  # get /strokes
  def index
    
    params[:angle] ||="15.0"
    pangle=params[:angle].to_i
    @strokes=Stroke.where(angle:pangle)
    t_points=(1..300).step(10).to_a
    @positions=Position.where(flight_time:t_points,strokes:{angle:pangle}).where("positions.height>-2.0").joins(:stroke)
    .select("positions.height,positions.distance, strokes.velocity as ini_velocity")
    gon.positions=@positions
    @angles=Stroke.all.select(:angle).distinct.order(:angle).map{|a| [a.angle,a.angle]}
  end
  
end
