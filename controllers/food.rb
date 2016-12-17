

# frozen_string_literal: true
require 'json'

# Share Learning API web service
class WorldcaApp < Sinatra::Base
  # Home page: show number of courses each resource contains

  get "/?" do
    result = GetWorldCals.call(params)
    if result.success?
      @data = AllGroupsView.new(result.value)
    else
      flash[:error] = result.value.message
    end

    slim :all_groups
  end
end
