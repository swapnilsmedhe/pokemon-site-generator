source scripts/generate_cards.sh
source scripts/generate_sidebar.sh
source scripts/helper_library.sh

function generate_page() {
  local pokemon_records="$1"
  local card_template="$2"
  local page_template="$3"
  local sidebar_items=($4)
  local page_name="$5"

  local cards=$( generate_pokemon_card_gallery "${card_template}" "${pokemon_records}" )
  local sidebar=$( generate_sidebar "${sidebar_items[*]}" "${page_name}" )

  sed "s:__SIDEBAR__:${sidebar}:; s:__CARDS__:${cards}:" <<< ${page_template}
}

function filter_records() {
  local records="$1"
  local type="$2"

  if [[ "${type}" == "all" ]]
  then
    echo "${records}"
    return
  fi
  local filtered_records=$( grep "^.*|.*|.*${type}.*|" <<< "${records}" )
  echo "${filtered_records}"
}

function get_unique() {
  local types="$1"
  
  local unique_types=$( tr "," "\n" <<< "${types}" | sort | uniq )
  echo ${unique_types}
}

function generate_site() {
  local target_directory="$1"
  local pokemon_records="$2"
  local card_template="$3"
  local page_template="$4"

  local types=$( get_types "${pokemon_records}" )
  local unique_types=( "all" $( get_unique "${types}" ) )

  for type in ${unique_types[@]}
  do
    echo "Generating ${type}.html"
    local pokemons_of_type=$( filter_records "${pokemon_records}" ${type} )
    local generated_page=$( generate_page "${pokemons_of_type}" "${card_template}" "${page_template}" "${unique_types[*]}" "${type}" )
    echo ${generated_page} > ${target_directory}/${type}.html
  done
}

function setup_site_directory() {
  local target_directory="$1"
  local styles_file="$2"
  local images_directory="$3"

  mkdir -p ${target_directory}
  cp ${styles_file} ${target_directory}
  cp -r ${images_directory} ${target_directory}
}

function main() {
  local target_directory="$1"
  local pokemon_records_file="$2"
  local card_template_file="$3"
  local page_template_file="$4"
  local styles_file="$5"
  local images_directory="$6"

  setup_site_directory "${target_directory}" "${styles_file}" "${images_directory}"

  local pokemon_records=$( tail -n+2 ${pokemon_records_file} )
  local card_template=$( cat ${card_template_file} )
  local page_template=$( cat ${page_template_file} )
  generate_site "${target_directory}" "${pokemon_records}" "${card_template}" "${page_template}"
}