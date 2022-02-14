#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_sidebar.sh

function generate_sidebar_menu_with_single_item() {
  local menu_items="grass"
  local selected_menu_item=""
  local test_description="Should generate sidebar menu with single item"
  local expected_sidebar_menu='<ul><li><a href="grass.html">grass</a></li></ul>'
  local actual_sidebar_menu=$( generate_sidebar_menu "${menu_items}" "${selected_menu_item}" )

  assert_expectation "${actual_sidebar_menu}" "${expected_sidebar_menu}" "${test_description}" "generate_sidebar_menu"
}

function generate_sidebar_menu_with_multiple_items() {
  local menu_items="electric ghost"
  local selected_menu_item=""
  local test_description="Should generate sidebar menu with multiple items"
  local expected_sidebar_menu='<ul><li><a href="electric.html">electric</a></li><li><a href="ghost.html">ghost</a></li></ul>'
  local actual_sidebar_menu=$( generate_sidebar_menu "${menu_items}" "${selected_menu_item}" )

  assert_expectation "${actual_sidebar_menu}" "${expected_sidebar_menu}" "${test_description}" "generate_sidebar_menu"
}

function generate_sidebar_menu_with_selected_item() {
  local menu_items="electric ghost"
  local selected_menu_item="ghost"
  local test_description="Should generate sidebar menu with selected item in it"
  local expected_sidebar_menu='<ul><li><a href="electric.html">electric</a></li><li class="ghost selected"><a href="ghost.html">ghost</a></li></ul>'
  local actual_sidebar_menu=$( generate_sidebar_menu "${menu_items}" "${selected_menu_item}" )

  assert_expectation "${actual_sidebar_menu}" "${expected_sidebar_menu}" "${test_description}" "generate_sidebar_menu"
}

function generate_sidebar_menu_test_cases() {
  generate_sidebar_menu_with_single_item
  generate_sidebar_menu_with_multiple_items
  generate_sidebar_menu_with_selected_item
}