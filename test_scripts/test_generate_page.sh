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

function test_generate_page() {
  local card_data="4|charmander|fire|65|39|62|52|43|85"
  local sidebar_items=("fire")
  local page_name="fire"
  local test_description="Should generate page html for given data"
  local expected_page_html='<html> <head> <title>Pokemon</title> <link rel="stylesheet" href="styles.css"> </head> <body> <div class="page_wrapper"> <nav class="sidebar"><ul><li class="fire selected"><a href="fire.html">fire</a></li></ul></nav> <main> <article class="pokemon-card"> <div class="pokemon-image"> <img src="images/charmander.png" alt="charmander" title="charmander"> </div> <section class="pokemon-details"> <header> <h2>charmander</h2> <div class="pokemon-type"> <div class="fire">fire</div> </div> </header> <table class="pokemon-stats"> <tbody> <tr> <th>Weight</th> <td>85</td> </tr> <tr> <th>Base XP</th> <td>62</td> </tr> <tr> <th>HP</th> <td>39</td> </tr> <tr> <th>Attack</th> <td>52</td> </tr> <tr> <th>Defense</th> <td>43</td> </tr> <tr> <th>Speed</th> <td>65</td> </tr> </tbody> </table> </section> </article> </main> </div> </body> </html>'
  local actual_page_html=$( generate_page "${card_data}" "${CARD_TEMPLATE}" "${PAGE_TEMPLATE}" "${sidebar_items[*]}" "${page_name}" )

  assert_expectation "${actual_page_html}" "${expected_page_html}" "${test_description}" "generate_page"
}

function generate_page_test_cases() {
  test_generate_page
}
