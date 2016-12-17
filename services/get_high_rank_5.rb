# frozen_string_literal: true

# Gets list of all groups from API
class GetHighRank5
  extend Dry::Monads::Either::Mixin

  def self.call
    results = HTTP.get("#{WorldcaApp.config.WORLDCA_API}/food/rank/high/5")
    Right(RankFoodsRepresenter.new(Rank_Foods.new).from_json(results.body))
  rescue
    Left(Error.new('Our servers failed - we are investigating!'))
  end
end
