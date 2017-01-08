# frozen_string_literal: true
require_relative 'spec_helper'

describe 'Homepage' do
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
      visit HomePage do |page|
        # THEN: user should see correct title, header, btn: learn more
        page.title.must_include 'World Ca'
        page.heading.must_include 'WorldCa'

        page.learn_more?
      end
    end

    it '(HAPPY) should see content' do
      # GIVEN: user goes to the homepage
      visit HomePage do |page|
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
