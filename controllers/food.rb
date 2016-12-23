

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

    result_daily = GetDailyConsumed.call
    if result.success?
      @data_Daily_Consumed = result_daily.value.worldcals
    else
      flash[:error] = result.value.message
    end

    slim :rank_high_5
  end
  get '/foods/:name/?' do
    #group_details = GetGroupDetails.call(params[:name])
    #if group_details.success?
    #  group_postings = group_details.value
    #  @group = GroupDetailsView.new(group_postings)
      slim :foods
    #else
    #  flash[:error] = 'Could not find that group -- we are investigating!'
    #  redirect '/'
    #end
  end
end
