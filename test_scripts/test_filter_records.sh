#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_site.sh

function filter_records_by_type() {
  local records=$( echo -e "6|charizard|fire,flying|100|78|240|84|78|905\n7|squirtle|water|43|44|63|48|65|90" )
  local type="flying"
  local expected_records="6|charizard|fire,flying|100|78|240|84|78|905"
  local test_description="Should filter records by given type"
  local actual_records=$( filter_records "${records}" "${type}" )
  
  assert_expectation "${actual_records}" "${expected_records}" "${test_description}" "filter_records"
}

function filter_records_test_cases() {
  filter_records_by_type
}
