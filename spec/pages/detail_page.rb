# frozen_string_literal: true

# Page object for detail page view (food_details)
class FoodDetailsPage
  include PageObject

  page_url 'http://localhost:9000/foods/top'

  h1(:detail_title, id: 'detail_title')
  table(:details_table, class: 'center.mdl-data-table.mdl-js-data-table')
  indexed_property(
    :foods,
    [
      [:img, :food_image, { id: 'food[%s].image' }],
      [:a, :food_link, { id: 'food[%s].link' }],
      [:td, :food_tag, { id: 'food[%s].tag' }]
    ]
  )

  def foods_count
    browser.trs(class: 'foods_row').count
  end

  def first_row
    foods[0]
  end
end
