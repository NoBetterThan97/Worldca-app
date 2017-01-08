# frozen_string_literal: true

# Page object for all groups view (homepage)
class HomePage
  include PageObject

  page_url 'http://localhost:9000/'

  span(:heading, class:'mdl-layout-title')
  a(:tab_top25, class: 'mdl-tabs__tab.is-active')
  a(:tab_less25, class: 'mdl-tabs__tab')
  button(:learn_more, class: 'mdl-button.mdl-button--colored.mdl-js-button.mdl-js-ripple-effect')
  table(:rank_table, class: 'center.mdl-data-table.mdl-js-data-table.set-table-outline')
  indexed_property(
    :foods,
    [
      [:img, :food_image, { id: 'food[%s].image' }],
      [:a, :food_link, { id: 'food[%s].link' }],
      [:span, :food_tag, { id: 'food[%s].consumptions' }]
    ]
  )

  div(:new_group_modal, class: 'modal-dialog')
  text_field(:new_group_input, id: 'fb_group_url_input')
  button(:new_group_submit, id: 'group-form-submit')

  def foods_count
    browser.trs(class: 'foods_row').count
  end

  def first_row
    foods[0]
  end
end
