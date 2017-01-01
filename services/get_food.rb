# frozen_string_literal: true

# Gets list of all groups from API
class GetFood
  extend Dry::Monads::Either::Mixin

  def self.call(name)
    results = HTTP.get("#{WorldcaApp.config.WORLDCA_API}/food/nutrix/#{name}")
    Right(FoodDetailsRepresenter.new(Food_Details.new).from_json(results.body))
  rescue
    Left(Error.new('Our servers failed - we are investigating!'))
  end
end
