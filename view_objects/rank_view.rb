# frozen_string_literal: true
class RankView
  attr_reader :foods

  def initialize(all_foods)
    @foods = all_foods.foods.map { |food| RankDescriptionView.new(food) }
  end
end

class RankDescriptionView
  attr_reader :id, :name, :image_url, :tag_amount

  def initialize(food)
    @id = food.id
    @name = food.name
    @image_url = food.image_url
    @tag_amount = food.tag_amount
  end
end
