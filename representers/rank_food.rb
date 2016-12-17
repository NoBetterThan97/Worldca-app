# frozen_string_literal: true

# Represents overall group information for JSON API output
class RankFoodRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :name
  property :photo
  property :tag_amount
end
