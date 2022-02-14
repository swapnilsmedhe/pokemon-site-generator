source scripts/helper_library.sh

function get_class() {
  local menu_item="$1"
  local selected_menu_item="$2"

  local class=""
  if [[ "${menu_item}" == "${selected_menu_item}" ]]
  then 
    class="${menu_item} selected"
  fi
  echo "${class}"
}

function create_link() {
  local anchor_text="$1"
  local link="$2"

  echo "<a href=\"${link}\">${anchor_text}</a>"
}

function generate_sidebar_menu() {
  local menu_items=($1)
  local selected_menu_item="$2"
  
  local sidebar_menu_items
  for item in ${menu_items[@]}
  do
    local link=$( create_link "${item}" "${item}.html" )
    local class=$( get_class "${item}" "${selected_menu_item}" )
    sidebar_menu_items+=$( generate_html "li" "${link}" "${class}" )
  done
  local sidebar_menu=$( generate_html "ul" "${sidebar_menu_items}" )
  echo ${sidebar_menu}
}

function generate_sidebar() {
  local sidebar_items=($1)
  local page_name="$2"

  local sidebar_menu=$( generate_sidebar_menu "${sidebar_items[*]}" "${page_name}" )
  local sidebar=$( generate_html "nav" "${sidebar_menu}" "sidebar" )
  echo ${sidebar}
}