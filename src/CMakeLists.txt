cmake_minimum_required(VERSION 3.20)

project(Chimera)
add_executable(Chimera Chimera.cpp Visitor.cpp AST.cpp)

target_include_directories(Chimera PUBLIC
                           "${PROJECT_BINAR}"
                           )

                           target_include_directories(Chimera PUBLIC
                           "${PROJECT_BINARY_DIR}/lib"
                           )