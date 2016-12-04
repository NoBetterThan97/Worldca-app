# frozen_string_literal: true
folders = 'values,representers,services,controllers'
Dir.glob("./{#{folders}}/init.rb").each do |file|
  require file
end
