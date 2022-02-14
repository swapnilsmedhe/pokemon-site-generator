#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_cards.sh

function test_enclose_types_for_single_type() {
  local types="fire"
  local tag="div"
  local expected_enclosed_types='<div class="fire">fire</div>'
  local test_description="Should enclose given type into given tag"
  local actual_enclosed_types=$( enclose_types ${types} ${tag} )
  
  assert_expectation "${actual_enclosed_types}" "${expected_enclosed_types}" "${test_description}" "enclose_types"
}

function test_enclose_types_for_multi_type() {
  local types="grass,poison"
  local tag="div"
  local expected_enclosed_types='<div class="grass">grass</div><div class="poison">poison</div>'
  local test_description="Should enclose each type into given tag"
  local actual_enclosed_types=$( enclose_types ${types} ${tag} )
  
  assert_expectation "${actual_enclosed_types}" "${expected_enclosed_types}" "${test_description}" "enclose_types"
}

function enclose_types_test_cases() {
  test_enclose_types_for_single_type
  test_enclose_types_for_multi_type
}

# enclose_types_test_cases