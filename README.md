# Food Truck Fantasy (C++ prototype)

Playable 2D anime-inspired prototype using C++17 and raylib 5.5. Graphics are placeholder vector shapes; replace with your own pixel art and sprite sheets later.

## Build (Windows, macOS, Linux)
Install CMake 3.20+ and a C++ compiler. Internet is required on the first build to download raylib.

```sh
cmake -S . -B build
cmake --build build --config Release
```

On Windows, launch `build/Release/FoodTruckFantasy.exe` (Visual Studio generator) or `build/FoodTruckFantasy.exe` (other generators).

## Gameplay
Start Game -> food truck. Click **Go Collect Ingredients** to choose an unlocked world. A/D or arrow keys move; Space/W/Up jumps; Tab switches between the four girls. Collect colored ingredients, avoid purple enemies, reach the far right to finish, or return to the truck early. At the truck, click a recipe to sell food if you have its ingredients. Money, inventory, unlocked levels, and sales persist while the game runs. Four worlds are included with different color themes and ingredient layouts.

This is a starter prototype, not a finished commercial game. It does not yet include imported sprite sheets, sound, customer AI, save files, or a full economic simulation. Money does not decrease yet; resource shortage triggers repeat collection runs.

## Browser publishing (Handshake-ready link workflow)

The C++ raylib prototype can be compiled to WebAssembly for browser hosting. Install and activate the [Emscripten SDK](https://emscripten.org/docs/getting_started/downloads.html), then run `./build_web.sh` in a Bash shell (Git Bash, macOS, or Linux). It creates `publish/index.html`, `FoodTruckFantasy.js`, and `FoodTruckFantasy.wasm`.

Upload the **contents** of `publish/` to a static web host that serves `.wasm` files, such as GitHub Pages or Netlify. Open the resulting public URL to test the game, then add that URL to your Handshake profile or game page if your Handshake account supports external links. If your Handshake platform directly hosts HTML5 games, upload the generated web files according to its upload instructions instead.

**Important:** `web/shell.html` is a template, not a playable game by itself. Browser build has not been compiled or verified in this environment (Emscripten SDK unavailable). No Handshake upload or publication has occurred.

### Updating characters later

Replace the four entries in the `girls` array in `main.cpp` to change names, palette, movement speed, and jump height. Future character sprites can replace the shape drawing code without changing the business and level logic.
