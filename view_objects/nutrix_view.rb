class NutrixView
  attr_reader :name, :serving_quantity, :serving_unit, :serving_weight, :calories, :fat, :saturated_fat, :cholesterol, :sodium, :carbohydrate, :dietary_fiber, :sugars, :protein, :potassium, :image_url

  def initialize(nutrix_food)
    @name = nutrix_food.name
    @serving_quantity = nutrix_food.serving_quantity
    @serving_unit = nutrix_food.serving_unit
    @calories = nutrix_food.calories
    @fat = nutrix_food.fat
    @saturated_fat = nutrix_food.saturated_fat
    @cholesterol = nutrix_food.cholesterol
    @sodium = nutrix_food.sodium
    @carbohydrate = nutrix_food.carbohydrate
    @dietary_fiber = nutrix_food.dietary_fiber
    @sugars = nutrix_food.sugars
    @protein = nutrix_food.protein
    @potassium = nutrix_food.potassium
    @image_url = nutrix_food.image_url

  end
end
