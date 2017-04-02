cmake_minimum_required(VERSION 3.1.3)
set(CMAKE_CXX_STANDARD 11)

# DEPENDENCIES_ROOT is a variable pointing to where terraform
# installed all dependencies. You can override it by
# passing -DDEPENDENCIES_ROOT=/other/path in cmake command line
set(DEPENDENCIES_ROOT "${CMAKE_SOURCE_DIR}/../.." CACHE PATH "Additional where your dependencies can be located")

# Asks CMake to try to find libraries in ${DEPENDENCIES_ROOT} too
list(APPEND CMAKE_PREFIX_PATH "${DEPENDENCIES_ROOT}")

# @PROJECT_TARGET@ is the executable name for "@GAME_NAME@" 
project(@PROJECT_TARGET@)

# FindPackage utilities. This is the place where you might put custom
# Find<XXX>.cmake files (where XXX is the name of a package) to find
# packages. Consult CMake documentation on how to write those.
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake-modules")

# Where the code for your game is going to be placed.
# Consult CMakeLists.txt inside of src/ to learn how to add new
# files to your project.
add_subdirectory(src)
