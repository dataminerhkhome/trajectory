class Stroke < ActiveRecord::Base
  has_many :positions
  

  
  def hit_point
    positions.where("height<0").first
  end
  
  def ground_point
    positions.where("height<-2.0").first
  end
  
  def middle_point
    positions.where("distance=10.5")
  end
end
