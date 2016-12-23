# frozen_string_literal: true
require_relative 'rank_food'

# Represents overall group information for JSON API output
class RankFoodsRepresenter < Roar::Decorator
  include Roar::JSON

  collection :foods, extend: RankFoodRepresenter, class: RankFoodDetails
end