# frozen_string_literal: true
class RankView
  attr_reader :foods

  def initialize(all_foods)
    @foods = all_foods.statistics.map { |food| RankDescriptionView.new(food) }
  end
end

class RankDescriptionView
  attr_reader :name, :image_url, :consumptions

  def initialize(foods)
    @name = foods.food.name
    @image_url = foods.food.image_url
    @consumptions = foods.consumptions
  end
end
