#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_sidebar.sh

function test_create_link_to_address() {
  local anchor_text="grass"
  local link="grass.html"
  local expected_link='<a href="grass.html">grass</a>'
  local test_description="Should create a link to given address"
  local actual_link=$( create_link "${anchor_text}" "${link}" )

  assert_expectation "${actual_link}" "${expected_link}" "${test_description}" "create_link"
}

function create_link_test_cases() {
  test_create_link_to_address
}