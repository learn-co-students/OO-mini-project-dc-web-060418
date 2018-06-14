class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end

  def self.most_common_allergen
    self.all.empty? ? "No Ingredients Added" :

    self.all.sort_by do |ingredient|
      ingredient.allergens.length
    end[-1]
  end

end
