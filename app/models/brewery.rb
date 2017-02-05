class Brewery < ActiveRecord::Base
    include RatingAverage
    validates :name, presence: true
    validates :year, numericality: { greater_than_or_equal_to: 1042
                                    less_than_or_equal_to: 2017,
                                    only_integer: true }
	has_many :beers, dependent: :destroy
    has_many :ratings, through: :beers

	def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
	end

    def to_s
    "#{name}"
	end

	def restart
    self.year = 2017
    puts "changed year to #{year}"
 	end

end
