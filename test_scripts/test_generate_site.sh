#! /bin/bash
source test_scripts/assert.sh
source scripts/generate_site.sh

CARD_TEMPLATE='<article class="pokemon-card">
  <div class="pokemon-image">
    <img src="images/__NAME__.png" alt="__NAME__" title="__NAME__">
  </div>
  <section class="pokemon-details">
    <header>
      <h2>__NAME__</h2>
      <div class="pokemon-type">
        __TYPES__
      </div>
    </header>
    <table class="pokemon-stats">
      <tbody>
        <tr>
          <th>Weight</th>
          <td>__WEIGHT__</td>
        </tr>
        <tr>
          <th>Base XP</th>
          <td>__BASE_XP__</td>
        </tr>
        <tr>
          <th>HP</th>
          <td>__HP__</td>
        </tr>
        <tr>
          <th>Attack</th>
          <td>__ATTACK__</td>
        </tr>
        <tr>
          <th>Defense</th>
          <td>__DEFENSE__</td>
        </tr>
        <tr>
          <th>Speed</th>
          <td>__SPEED__</td>
        </tr>
      </tbody>
    </table>
  </section>
</article>'
PAGE_TEMPLATE='<html>
<head>
  <title>Pokemon</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <div class="page_wrapper">
    __SIDEBAR__
    <main>
      __CARDS__
    </main>
  </div>
</body>
</html>'

function test_generate_site() {
  local directory_name="generated_site"
  mkdir -p "${directory_name}"
  local site_data="1|bulbasaur|grass|45|45|64|49|49|69"
  local expected_files=$( echo -e "${directory_name}/all.html\n${directory_name}/grass.html" )
  local test_description="Should generate site with given data in given directory"
  generate_site "${directory_name}" "${site_data}" "${CARD_TEMPLATE}" "${PAGE_TEMPLATE}" > /dev/null
  local actual_files=$( ls ${directory_name}/*.html ) 

  assert_expectation "${actual_files}" "${expected_files}" "${test_description}" "generate_site"
  rm -rf ${directory_name}
}

function generate_site_test_cases() {
  test_generate_site
}