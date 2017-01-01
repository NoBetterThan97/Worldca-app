

# frozen_string_literal: true
require 'json'

# Share Learning API web service
class WorldcaApp < Sinatra::Base
  # Home page: show number of courses each resource contains
  get "/?" do
    criteria = RankCriteria.new(true, 5)
    result = GetRank.call(criteria)
    if result.success?
      @data_top = RankView.new(result.value)
    else
      flash[:error] = result.value.message
    end

    criteria = RankCriteria.new(false, 5)
    result = GetRank.call(criteria)
    if result.success?
      @data_less = RankView.new(result.value)
    else
      flash[:error] = result.value.message
    end

    result_daily = GetDailyConsumed.call
    if result.success?
      @data_Daily_Consumed = result_daily.value.worldcals
    else
      flash[:error] = result.value.message
    end

    slim :foods
  end
  get '/foods/nutrix/:name/?' do
    result = GetFood.call(params[:name])
    if result.success?
      @data = result.value
      slim :food_details
    else
      flash[:error] = 'Could not find that group -- we are investigating!'
      redirect '/'
    end
  end
  get '/foods/top' do
    criteria = RankCriteria.new(true, 25)
    result = GetRank.call(criteria)
    if result.success?
      @data = RankView.new(result.value)
    else
      flash[:error] = result.value.message
    end
    slim :rank
  end
  get '/foods/less' do
    criteria = RankCriteria.new(false, 25)
    result = GetRank.call(criteria)
    if result.success?
      @data = RankView.new(result.value)
    else
      flash[:error] = result.value.message
    end
    slim :rank
  end
end
