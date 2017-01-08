# frozen_string_literal: true

# Gets list of all groups from API
class GetRank
  extend Dry::Monads::Either::Mixin

  def self.call(count)
    results = HTTP.get("#{WorldcaApp.config.WORLDCA_API}/foods?limit=#{count}")
    Right(StatisticsRepresenter.new(Statistics.new).from_json(results.body))
  rescue
    Left(Error.new('Our servers failed - we are investigating!'))
  end
end
