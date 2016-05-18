class StrokesController < ApplicationController
  
  # get /strokes
  def index
    if params.key? :velocity
          pvelocity=params[:velocity].to_i
    @strokes=Stroke.where(velocity:pvelocity)
    t_points=(1..300).step(10).to_a
    @positions=Position.where(flight_time:t_points,strokes:{velocity:pvelocity}).where("positions.height>-2.0").joins(:stroke)
    .select("positions.height,positions.distance, strokes.angle as ini_variable")
      
    else
    params[:angle] ||="15.0"
    pangle=params[:angle].to_i
    @strokes=Stroke.where(angle:pangle)
    t_points=(1..300).step(10).to_a
    @positions=Position.where(flight_time:t_points,strokes:{angle:pangle}).where("positions.height>-2.0").joins(:stroke)
    .select("positions.height,positions.distance, strokes.velocity as ini_variable")
    

    end
    gon.positions=@positions
    @angles=Stroke.all.select(:angle).distinct.order(:angle).map{|a| [a.angle,a.angle]}
    @speeds=Stroke.all.select(:velocity).distinct.order(:velocity).map{|a| [a.velocity,a.velocity]}
  end
  
end
