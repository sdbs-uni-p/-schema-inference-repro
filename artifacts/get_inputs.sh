#!/bin/bash
date=$(date '+%Y-%m-%d')
if [[ `wget -S --spider https://github.com/wija/follow/raw/5efbd3de9e81b78e7aa7e4b164ee0fe5e4c885fa/maps/Germany.json  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    wget -q https://github.com/wija/follow/raw/5efbd3de9e81b78e7aa7e4b164ee0fe5e4c885fa/maps/Germany.json -O input/wija/wija_Germany.json \
    && sed -i "s/August 9th 2022/${date}/" input/wija/SOURCE; fi
if [[ `wget -S --spider https://raw.githubusercontent.com/AtelierCartographie/Khartis/29008c92d505c0ccf07f75f4be1033986137a33d/public/data/map/EU-nuts2-2016/EU.json  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    wget -q https://raw.githubusercontent.com/AtelierCartographie/Khartis/29008c92d505c0ccf07f75f4be1033986137a33d/public/data/map/EU-nuts2-2016/EU.json -O input/AtelierCartographie/AtelierCartographie_EU.json \
    && sed -i "s/August 9th 2022/${date}/" input/AtelierCartographie/SOURCE; fi
if [[ `wget -S --spider https://github.com/reinterpretcat/utymap/raw/cd4fe4cace05a988420d3aaecd780d0fbe3cd3bb/core/test/test_assets/osm/berlin.osm.json  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    wget -q https://github.com/reinterpretcat/utymap/raw/cd4fe4cace05a988420d3aaecd780d0fbe3cd3bb/core/test/test_assets/osm/berlin.osm.json -O input/reinterpretcat/reinterpretcat_berlin.osm.json \
    && sed -i "s/August 9th 2022/${date}/" input/reinterpretcat/SOURCE; fi
if [[ `wget -S --spider https://github.com/stenson/notebook/raw/ddf8d84e694a1ba6425008cb65009be2a392d105/sites/robstenson.com/articles/birthplaces/members.json  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    wget -q https://github.com/stenson/notebook/raw/ddf8d84e694a1ba6425008cb65009be2a392d105/sites/robstenson.com/articles/birthplaces/members.json -O input/stenson/stenson_members.json \
    && sed -i "s/August 9th 2022/${date}/" input/stenson/SOURCE; fi
if [[ `wget -S --spider https://dataworks.calderdale.gov.uk/download/2rpld/cls/Local%20Wildlife%20Sites.json  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    wget -q https://dataworks.calderdale.gov.uk/download/2rpld/cls/Local%20Wildlife%20Sites.json -O "input/CalderdaleCouncil/Local Wildlife Sites.json" \
    && sed -i "s/August 9th 2022/${date}/" input/CalderdaleCouncil/SOURCE; fi
