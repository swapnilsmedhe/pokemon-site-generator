source scripts/generate_sidebar.sh
source test_scripts/assert.sh

function get_class_if_item_selected() {
  local menu_item="grass"
  local selected_menu_item="grass"
  local expected_class="grass selected"
  local test_description="Should give the class if menu item is selected"
  local actual_class=$( get_class "${menu_item}" "${selected_menu_item}" )

  assert_expectation "${actual_class}" "${expected_class}" "${test_description}" "get_class"
}

function get_class_if_item_not_selected() {
  local menu_item="fire"
  local selected_menu_item="ice"
  local expected_class=""
  local test_description="Should not give the class if menu item is not selected"
  local actual_class=$( get_class "${menu_item}" "${selected_menu_item}" )

  assert_expectation "${actual_class}" "${expected_class}" "${test_description}" "get_class"
}

function get_class_test_cases() {
  get_class_if_item_selected
  get_class_if_item_not_selected
}