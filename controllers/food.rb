

# frozen_string_literal: true
require 'json'

# Share Learning API web service
class WorldcaApp < Sinatra::Base
  # Home page: show number of courses each resource contains

  get "/?" do

    erb :home
  end
  
  get "/food_name/?" do
    result = GetAllFoods.call

    if result.success?
      @data = result.value
    else
      flash[:error] = result.value.message
    end

    slim :foods
  end
end
