class Brewery < ActiveRecord::Base
    include RatingAverage
    validate :year_validation
    validates :name, presence: true
    validates :year, presence: true
	has_many :beers, dependent: :destroy
    has_many :ratings, through: :beers

    def year_validation
        if year.present? && (year < 1042 || year > Time.now.year)
            errors.add(:year, "invalid year")
        end
    end

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
