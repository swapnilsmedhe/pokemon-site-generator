#! /bin/bash
source scripts/generate_site.sh

TARGET_DIR="html"
POKEMON_RECORDS="resources/data/pokemon.csv"
CARD_TEMPLATE="resources/templates/pokemon_card.html"
PAGE_TEMPLATE="resources/templates/page.html"
STYLES_FILE="resources/styles.css"
IMAGES_DIR="resources/images"

rm -rf ${TARGET_DIR}
main "${TARGET_DIR}" "${POKEMON_RECORDS}" "${CARD_TEMPLATE}" "${PAGE_TEMPLATE}" "${STYLES_FILE}" "${IMAGES_DIR}"