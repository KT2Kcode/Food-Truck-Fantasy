cmake_minimum_required(VERSION 3.20)
project(FoodTruckFantasy LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
include(FetchContent)
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_GAMES OFF CACHE BOOL "" FORCE)
FetchContent_Declare(raylib GIT_REPOSITORY https://github.com/raysan5/raylib.git GIT_TAG 5.5)
FetchContent_MakeAvailable(raylib)
add_executable(FoodTruckFantasy main.cpp)
target_link_libraries(FoodTruckFantasy PRIVATE raylib)
if(EMSCRIPTEN)
  set_target_properties(FoodTruckFantasy PROPERTIES SUFFIX ".html")
  target_link_options(FoodTruckFantasy PRIVATE
    "-sUSE_GLFW=3" "-sALLOW_MEMORY_GROWTH=1" "-sASSERTIONS=1"
    "-sEXPORTED_RUNTIME_METHODS=['ccall','cwrap']"
    "--shell-file=${CMAKE_CURRENT_SOURCE_DIR}/web/shell.html")
endif()
