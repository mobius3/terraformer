# This CMakeLists.txt is responsible for listing your project sources and
# linking the resulting executable to FusionEngine

# Must be the same as parent's CMakeLists.txt
project(@PROJECT_TARGET@)

# This variable lists all the sources that need to be compiled
# in your project. Whenever you add new cpp files, you should
# change this variable to reflect that.
set(SOURCES main.cpp)

# This command orders CMake to create your executable
# by compiling everything in the SOURCES variable.
add_executable(@PROJECT_TARGET@ ${SOURCES})
