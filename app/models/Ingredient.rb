
class Ingredient
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
  end



  #----
  def allergic_users
    Allergen.all.map do |allergen|
      allergen.user_O if allergen.ingredient_O == self
    end.compact
  end


  # - `Ingredient.most_common_allergen`
  # should return the ingredient instance that the highest number of users are allergic to

  def self.most_common_allergen
    allergen_user_count_hash = {}
    Allergen.all.each do |allergen|
      allergen_user_count_hash[allergen.ingredient_O] = allergen.ingredient_O.allergic_users.count
    end
    allergen_user_count_hash.sort_by{|key, value| value}[-1][0]
  end


end
