source scripts/helper_library.sh

function get_pokemon_name() {
  local record="$1"

  local pokemon_name=$( get_field "${record}" 2 ) 
  echo ${pokemon_name}
}

function get_speed() {
  local record="$1"

  local speed=$( get_field "${record}" 4 ) 
  echo ${speed}
}

function get_hp() {
  local record="$1"
  local hp=$( get_field "${record}" 5 ) 
  echo ${hp}
}

function get_base_xp() {
  local record="$1"

  local base_xp=$( get_field "${record}" 6 ) 
  echo ${base_xp}
}

function get_attack_value() {
  local record="$1"

  local attack_value=$( get_field "${record}" 7 ) 
  echo ${attack_value}
}

function get_defense_value() {
  local record="$1"

  local defense_value=$( get_field "${record}" 8 ) 
  echo ${defense_value}
}

function get_weight() {
  local record="$1"

  local weight=$( get_field "${record}" 9 ) 
  echo ${weight}
}

function enclose_types() {
  local types="$1"
  local tag="$2"

  local enclosed_types
  OLDIFS=$IFS
  IFS=','
  for type in ${types}
  do
    enclosed_types+=$( generate_html ${tag} ${type} ${type} )
  done
  IFS=$OLDIFS
  echo "${enclosed_types}"
}

function generate_pokemon_card() {
  local card_template="$1"
  local pokemon_details="$2"

  local pokemon_name=$( get_pokemon_name ${pokemon_details} )
  local types=$( get_types ${pokemon_details} )
  local enclosed_types=$( enclose_types ${types} "div" )
  local speed=$( get_speed ${pokemon_details} )
  local hp=$( get_hp ${pokemon_details} )
  local base_xp=$( get_base_xp ${pokemon_details} )
  local attack_value=$( get_attack_value ${pokemon_details} )
  local defense_value=$( get_defense_value ${pokemon_details} )
  local weight=$( get_weight ${pokemon_details} )

  sed "s:__NAME__:${pokemon_name}:g;
  s:__TYPES__:${enclosed_types}:g;
  s:__SPEED__:${speed}:;
  s:__HP__:${hp}:;
  s:__BASE_XP__:${base_xp}:;
  s:__ATTACK__:${attack_value}:;
  s:__DEFENSE__:${defense_value}:;
  s:__WEIGHT__:${weight}:" <<< ${card_template}

}

function generate_pokemon_card_gallery() {
  local card_template="$1" 
  local pokemon_records="$2"

  local pokemon_cards
  for record in ${pokemon_records}
  do
    pokemon_cards+=$( generate_pokemon_card "${card_template}" "${record}" )
  done 
  echo "${pokemon_cards}"
}