# frozen_string_literal: true
require_relative 'spec_helper'

describe 'Detailspage' do
  before do
    unless @browser
      #@headless = Headless.new
      @browser = Watir::Browser.new
    end
  end

  after do
    @browser.close
    #@headless.destroy
  end

  describe 'Page elements' do
    include PageObject::PageFactory

    it '(HAPPY) should see website features' do
      # GIVEN: user goes to the home page
      visit FoodDetailsPage do |page|
        # THEN: user should see correct title, header
        page.title.must_include 'World Ca'
        page.detail_title.must_include 'TOP 25'
      end
    end

    it '(HAPPY) should see content' do
      # GIVEN: user goes to the homepage
      visit FoodDetailsPage do |page|
        # THEN: user should see a row with group information and links
        page.foods_count.must_be :>=, 0
        page.first_row.food_image_element.wont_be_nil
        page.first_row.food_link_element.href.must_include '/foods/nutrix/'
        tags =page.first_row.food_tag.to_i
        tags.must_be :>=, 0
      end
    end
  end
end
