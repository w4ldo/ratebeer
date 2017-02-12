class User < ActiveRecord::Base
    include RatingAverage
    has_secure_password
    validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 30 }
    has_many :ratings, dependent: :destroy
    has_many :beers, through: :ratings
    has_many :memberships, dependent: :destroy
    has_many :beer_clubs, through: :memberships
    validates :password, length: { minimum: 4 }   
    validates :password, format: { with: /([A-Z].*\d)|(\d.*[A-Z].*)/,
              message: "should contain one number and one capital letter" }     

    def to_s
    "#{username}"
	end

    def favorite_beer
     return nil if ratings.empty?
     ratings.order(score: :desc).limit(1).first.beer
    end

    def favorite_style
     return nil if ratings.empty?
    end

    def favorite_brewery
     return nil if ratings.empty?
    end

end
