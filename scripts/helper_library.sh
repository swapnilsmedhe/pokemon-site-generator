function generate_html {
  local tag="$1"
  local content="$2"
  local class="$3"

  local html="<$tag>${content}</${tag}>"
  if [[ ${class} != "" ]]
  then
    html="<$tag class=\"${class}\">${content}</${tag}>"
  fi
  echo "${html}"
}

function get_field() {
  local records="$1"
  local field_number=$2
  cut -d"|" -f${field_number} <<< "${records}"
}

function get_types() {
  local records="$1"

  local types=$( get_field "${records}" 3 ) 
  echo "${types}"
}