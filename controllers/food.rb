

# frozen_string_literal: true
require 'json'

# Share Learning API web service
class WorldcaApp < Sinatra::Base
  # Home page: show number of courses each resource contains

  get "/?" do
    result = GetHighRank5.call
    if result.success?
      @data = RankView.new(result.value)
    else
      flash[:error] = result.value.message
    end

    slim :rank_high_5
  end
end
