source test_scripts/assert.sh
source scripts/generate_cards.sh

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

function test_generate_pokemon_card() {
  local expected_card_html='<article class="pokemon-card"> <div class="pokemon-image"> <img src="images/charmander.png" alt="charmander" title="charmander"> </div> <section class="pokemon-details"> <header> <h2>charmander</h2> <div class="pokemon-type"> <div class="fire">fire</div> </div> </header> <table class="pokemon-stats"> <tbody> <tr> <th>Weight</th> <td>85</td> </tr> <tr> <th>Base XP</th> <td>62</td> </tr> <tr> <th>HP</th> <td>39</td> </tr> <tr> <th>Attack</th> <td>52</td> </tr> <tr> <th>Defense</th> <td>43</td> </tr> <tr> <th>Speed</th> <td>65</td> </tr> </tbody> </table> </section> </article>' 
  local pokemon_details="1|charmander|fire|65|39|62|52|43|85"
  local test_description="Should generate a pokemon card"
  local actual_card_html=$(generate_pokemon_card "${CARD_TEMPLATE}" "${pokemon_details}")

  assert_expectation "${actual_card_html}" "${expected_card_html}" "${test_description}" "generate_pokemon_card"
}

function generate_pokemon_card_test_cases() {
  test_generate_pokemon_card
}