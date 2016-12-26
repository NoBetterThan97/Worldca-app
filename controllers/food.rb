

# frozen_string_literal: true
require 'json'

# Share Learning API web service
class WorldcaApp < Sinatra::Base
  # Home page: show number of courses each resource contains

  get "/?" do

    slim :foods

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
