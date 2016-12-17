# frozen_string_literal: true
class RankView
  attr_reader :foods

  def initialize(all_foods)
    @foods = all_foods.foods.map { |food| RankDescriptionView.new(food) }
  end
end

class RankDescriptionView
  attr_reader :id, :food_name, :photo, :tag_amount

  def initialize(food)
    @id = food.id
    @food_name = food.food_name
    @photo = food.photo
    @tag_amount = food.tag_amount
  end
end
