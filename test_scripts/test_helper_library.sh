#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_cards.sh

#testing generate_html
function generate_html_without_class() {
  local tag="div"
  local content="grass"
  local class=""
  local expected_html="<div>grass</div>"
  local test_description="Should generate html without class for given content with given tag"
  local actual_html=$( generate_html "${tag}" "${content}" "${class}" )
  
  assert_expectation "${actual_html}" "${expected_html}" "${test_description}" "generate_html"
}

function generate_html_with_class() {
  local tag="div"
  local content="grass"
  local class="type"
  local expected_html='<div class="type">grass</div>'
  local test_description="Should generate html with class for given content with given tag"
  local actual_html=$( generate_html "${tag}" "${content}" "${class}" )
  
  assert_expectation "${actual_html}" "${expected_html}" "${test_description}" "generate_html"
}

function generate_html_test_cases() {
  generate_html_without_class
  generate_html_with_class
}

#testing get_field

function get_field_by_field_number() {
  local record="1|bulbasaur|grass,poison|45|45|64|49|49|69"
  local field_number=2
  local expected_field_value="bulbasaur"
  local test_description="Should give field value based on the given field number"
  local actual_field_value=$( get_field ${record} ${field_number} )
  
  assert_expectation "${actual_field_value}" "${expected_field_value}" "${test_description}" "get_field"
}

function get_field_test_cases() {
  get_field_by_field_number
}

#testing get_types

function test_get_types() {
  local record="3|venusaur|grass,poison|80|80|236|82|83|1000"
  local expected_types="grass,poison"
  local test_description="Should give pokemon types from the record"
  local actual_types=$( get_types ${record} )

  assert_expectation "${actual_types}" "${expected_types}" "${test_description}" "get_types"
}

function get_types_test_cases() {
  test_get_types
}

function helper_functions_test_cases() {
  echo -e "\ngenerate_html"
  generate_html_test_cases

  echo -e "\nget_field"
  get_field_test_cases

  echo -e "\nget_types"
  get_types_test_cases
}