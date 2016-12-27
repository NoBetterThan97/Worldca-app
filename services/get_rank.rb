# frozen_string_literal: true

# Gets list of all groups from API
class GetRank
  extend Dry::Monads::Either::Mixin

  def self.call(criteria)
    if criteria[:degree]
      results = HTTP.get("#{WorldcaApp.config.WORLDCA_API}/food/rank/high/#{criteria[:count]}")
    else
      results = HTTP.get("#{WorldcaApp.config.WORLDCA_API}/food/rank/low/#{criteria[:count]}")
    end
    Right(RankFoodsRepresenter.new(Rank_Foods.new).from_json(results.body))
  rescue
    Left(Error.new('Our servers failed - we are investigating!'))
  end
end
