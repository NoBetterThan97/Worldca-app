# frozen_property_literal: true

# Represents overall group information for JSON API output
class FoodRepresenter < Roar::Decorator
  include Roar::JSON
  property :id
  property :name
  property :consumed_at
  property :serving_qty
  property :serving_unit
  property :serving_weight_grams
  property :nf_calories
  property :nf_total_fat
  property :nf_saturated_fat
  property :nf_cholesterol
  property :nf_sodium
  property :nf_total_carbohydrate
  property :nf_dietary_fiber
  property :nf_sugars
  property :nf_protein
  property :nf_potassium
  property :image_url
end
