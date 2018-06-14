

class Allergen

  attr_accessor :user_O, :ingredient_O

  @@all = []

  def self.all
    @@all
  end

  def initialize(user_O, ingredient_O)
    @user_O = user_O
    @ingredient_O = ingredient_O
    self.class.all << self
  end





end
