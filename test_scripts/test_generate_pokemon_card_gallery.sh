#! /bin/bash
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

function generate_pokemon_card_gallery_for_single_pokemon() {
  local pokemon_records="1|bulbasaur|grass,poison|45|45|64|49|49|69"
  local expected_html='<article class="pokemon-card"> <div class="pokemon-image"> <img src="images/bulbasaur.png" alt="bulbasaur" title="bulbasaur"> </div> <section class="pokemon-details"> <header> <h2>bulbasaur</h2> <div class="pokemon-type"> <div class="grass">grass</div><div class="poison">poison</div> </div> </header> <table class="pokemon-stats"> <tbody> <tr> <th>Weight</th> <td>69</td> </tr> <tr> <th>Base XP</th> <td>64</td> </tr> <tr> <th>HP</th> <td>45</td> </tr> <tr> <th>Attack</th> <td>49</td> </tr> <tr> <th>Defense</th> <td>49</td> </tr> <tr> <th>Speed</th> <td>45</td> </tr> </tbody> </table> </section> </article>'
  local test_description="Should generate a single pokemon card gallery"
  local actual_html=$( generate_pokemon_card_gallery "${CARD_TEMPLATE}" "${pokemon_records}" )
  
  assert_expectation "${actual_html}" "${expected_html}" "${test_description}" "generate_pokemon_card_gallery"
}
    
function generate_pokemon_card_gallery_for_multiple_pokemons() {
  local pokemon_records=$( echo -e "1|bulbasaur|grass,poison|45|45|64|49|49|69\n2|ivysaur|grass,poison|60|60|142|62|63|130" )
  local expected_html='<article class="pokemon-card"> <div class="pokemon-image"> <img src="images/bulbasaur.png" alt="bulbasaur" title="bulbasaur"> </div> <section class="pokemon-details"> <header> <h2>bulbasaur</h2> <div class="pokemon-type"> <div class="grass">grass</div><div class="poison">poison</div> </div> </header> <table class="pokemon-stats"> <tbody> <tr> <th>Weight</th> <td>69</td> </tr> <tr> <th>Base XP</th> <td>64</td> </tr> <tr> <th>HP</th> <td>45</td> </tr> <tr> <th>Attack</th> <td>49</td> </tr> <tr> <th>Defense</th> <td>49</td> </tr> <tr> <th>Speed</th> <td>45</td> </tr> </tbody> </table> </section> </article><article class="pokemon-card"> <div class="pokemon-image"> <img src="images/ivysaur.png" alt="ivysaur" title="ivysaur"> </div> <section class="pokemon-details"> <header> <h2>ivysaur</h2> <div class="pokemon-type"> <div class="grass">grass</div><div class="poison">poison</div> </div> </header> <table class="pokemon-stats"> <tbody> <tr> <th>Weight</th> <td>130</td> </tr> <tr> <th>Base XP</th> <td>142</td> </tr> <tr> <th>HP</th> <td>60</td> </tr> <tr> <th>Attack</th> <td>62</td> </tr> <tr> <th>Defense</th> <td>63</td> </tr> <tr> <th>Speed</th> <td>60</td> </tr> </tbody> </table> </section> </article>'
  local test_description="Should generate a pokemon card gallery for multiple pokemons"
  local actual_html=$( generate_pokemon_card_gallery "${CARD_TEMPLATE}" "${pokemon_records}" )
  
  assert_expectation "${actual_html}" "${expected_html}" "${test_description}" "generate_pokemon_card_gallery"
}

function generate_pokemon_card_gallery_test_cases() {
  generate_pokemon_card_gallery_for_single_pokemon
  generate_pokemon_card_gallery_for_multiple_pokemons
}