#! /bin/bash
source test_scripts/assert.sh
source test_scripts/test_generate_cards.sh
source test_scripts/test_enclose_types.sh
source test_scripts/test_generate_pokemon_card_gallery.sh
source test_scripts/test_helper_library.sh
source test_scripts/test_create_link.sh
source test_scripts/test_get_class.sh
source test_scripts/test_generate_sidebar_menu.sh
source test_scripts/test_generate_sidebar.sh
source test_scripts/test_generate_page.sh
source test_scripts/test_filter_records.sh
source test_scripts/test_generate_site.sh

function all_test_cases() {
  echo "generate_pokemon_card"
  generate_pokemon_card_test_cases

  echo -e "\nenclose_types"
  enclose_types_test_cases
  
  echo -e "\ngenerate_pokemon_card_gallery"
  generate_pokemon_card_gallery_test_cases
  
  echo -e "\ncreate_link"
  create_link_test_cases
  
  echo -e "\nget_class"
  get_class_test_cases
  
  echo -e "\ngenerate_sidebar_menu"
  generate_sidebar_menu_test_cases
  
  echo -e "\ngenerate_sidebar"
  generate_sidebar_test_cases
  
  echo -e "\ngenerate_page"
  generate_page_test_cases
  
  echo -e "\nfilter_records"
  filter_records_test_cases

  echo -e "\ngenerate_site"
  generate_site_test_cases
  
  echo -e "\nHelper Functions"
  helper_functions_test_cases
}

all_test_cases
display_failed_records