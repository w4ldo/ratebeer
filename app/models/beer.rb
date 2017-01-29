class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def to_s
    name
	end

  def average_rating
    id = self.id
    Rating.where("beer_id = #{id}").average(:score)
   # [1, 2, 3, 4].inject(0) { |result, element| result + element } # => 10
  end

end
