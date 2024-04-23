cmake_minimum_required(VERSION 3.20)

project(Chimera)




include(FetchContent)

FetchContent_Declare(json URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz)
FetchContent_MakeAvailable(json)

FetchContent_Declare(opts URL https://github.com/jarro2783/cxxopts/archive/refs/tags/v3.2.0.tar.gz)
FetchContent_MakeAvailable(opts)



set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 20 CACHE STRING "")

add_executable(Chimera Chimera.cpp Visitor.cpp AST.cpp ConstantsReplacerVisitor.cpp)

target_link_libraries(Chimera PRIVATE nlohmann_json::nlohmann_json)
target_link_libraries(Chimera PRIVATE cxxopts::cxxopts)

