#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_sidebar.sh

function test_generate_sidebar() {
  local sidebar_items="electric"
  local page_name="electric"
  local test_description="Should generate sidebar with the given items"
  local expected_sidebar='<nav class="sidebar"><ul><li class="electric selected"><a href="electric.html">electric</a></li></ul></nav>'
  local actual_sidebar=$( generate_sidebar "${sidebar_items}" "${page_name}" )

  assert_expectation "${actual_sidebar}" "${expected_sidebar}" "${test_description}" "generate_sidebar"
}

function generate_sidebar_test_cases() {
  test_generate_sidebar
}