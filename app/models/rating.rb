
class Rating < ActiveRecord::Base
  belongs_to :beer

  def to_s
    beer = Beer.find self.beer_id
    "#{beer.name} #{score}"
	end

end