#COMPLETED BY JARED AND ANTHONY

class RecipeCard
    @@all = []

    attr_accessor :date, :rating, :user, :recipe

    def initialize(date, rating, user, recipe)
        @date = RecipeCard.format_date(date)
        @rating = rating
        @user = user
        @recipe = recipe
        @@all << self
    end

    def self.all
        @@all
    end

    def self.format_date(str_date)
        date_arr = str_date.split("/")
        date_hash = {
            month: date_arr[0],
            day: date_arr[1],
            year: date_arr[2]
        }
    end
end