#!/usr/bin/env bash
set -euo pipefail
if ! command -v emcmake >/dev/null 2>&1; then echo 'Install/activate Emscripten SDK first: https://emscripten.org/docs/getting_started/downloads.html'; exit 1; fi
emcmake cmake -S . -B build-web -DCMAKE_BUILD_TYPE=Release
cmake --build build-web --parallel
mkdir -p publish
cp build-web/FoodTruckFantasy.html publish/index.html
cp build-web/FoodTruckFantasy.js publish/
cp build-web/FoodTruckFantasy.wasm publish/
if [ -f build-web/FoodTruckFantasy.data ]; then cp build-web/FoodTruckFantasy.data publish/; fi
echo 'Browser game generated in publish/. Upload the contents of that folder to a static web host.'
