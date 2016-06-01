# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.establish_connection

ActiveRecord::Base.connection.execute("TRUNCATE strokes CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE positions CASCADE")

ActiveRecord::Base.connection.reset_pk_sequence!('strokes')
ActiveRecord::Base.connection.reset_pk_sequence!('positions')

# Account
# vt=6.50
# g=9.8
# vstart=25.0
# angle_start=15.0
# (10..60).step(5).each do |angle_i|
  # angle=angle_i.to_f
# 
  # sin_r=Math.sin(angle/180*Math::PI)
  # cos_r=Math.cos(angle/180*Math::PI)
  # (25..60).step(5).each do |speed_i|
    # vi=speed_i.to_f
# 
    # v_yi=vi*sin_r
    # v_xi=vi*cos_r
# 
    # t_top=vt/g*Math.atan(v_yi/vt)
    # tan_r=Math.atan(vt/v_yi)
    # y_top=vt**2/g*Math::log(Math.sin(g*t_top/vt+tan_r)/Math.sin(tan_r))
    # stroke= Stroke.create(velocity:speed_i,angle: angle_i, height:y_top,rise_time:t_top)
    # puts "#{t_top},#{y_top}"
    # y_pre=0
    # (1..400).each do |index|
      # t=index*0.01
      # vx=v_xi*vt**2/(v_xi*g*t+vt**2)
      # x=vt**2/g*Math::log(v_xi/vx)
      # if t<=t_top
        # vy=(v_yi-vt*Math.tan(g*t/vt))/(1+v_yi/vt*Math.tan(g*t/vt))
        # y=vt**2/g*Math::log(Math.sin(g*t/vt+tan_r)/Math.sin(tan_r))
# 
      # else
        # exp=Math.exp(2*g*(t-t_top)/vt)
      # vy=vt*(exp-1)/(exp+1)
      # y=y_pre-vy*0.01
      # end
      # #
      # y_pre=y
      # position=Position.create!(x_speed:vx,y_speed:vy,distance:x,height:y,flight_time:index,stroke:stroke)
    # end
  # end
# end

