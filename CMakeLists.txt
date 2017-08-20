project(terraforming)
cmake_minimum_required(VERSION 3.0)
message("")

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake-modules")

get_filename_component(POSSIBLE_ROOT ${CMAKE_SOURCE_DIR}/../ ABSOLUTE)

# Get the external root path
set(TERRAFORM_ROOT ${POSSIBLE_ROOT} CACHE PATH "Place where environment will be created")
set(CMAKE_FIND_ROOT_PATH "${TERRAFORM_ROOT}")

set(TERRAFORM_TARGETS "" CACHE STRING "semi-colon separated values of targets to build")

if (NOT TERRAFORM_TARGETS)
  file(GLOB TERRAFORM_RECIPES_FILES recipes/*.cmake)
  foreach(RECIPE_FILE ${TERRAFORM_RECIPES_FILES})
    get_filename_component(TARGET ${RECIPE_FILE} NAME_WE)
    list(APPEND TERRAFORM_TARGETS ${TARGET})
  endforeach()
endif()

foreach (TARGET ${TERRAFORM_TARGETS})
  if (EXISTS "${CMAKE_SOURCE_DIR}/recipes/${TARGET}.cmake")
    include(recipes/${TARGET}.cmake)
  else ()
    message(FATAL_ERROR "${TARGET} building was asked, but its recipe was not found (${CMAKE_SOURCE_DIR}/recipes/${TARGET}.cmake)")
  endif ()
endforeach ()


# Command to create a new project
add_custom_target(new-project
  COMMAND ${CMAKE_COMMAND}
  -DSKEL_DIR=${CMAKE_SOURCE_DIR}/skel
  -DTERRAFORM_DIR=${CMAKE_SOURCE_DIR}
  -DTERRAFORM_ROOT=${TERRAFORM_ROOT}
  -DPROJECT_NAME="\${PROJECT_NAME}"
  -P ${CMAKE_SOURCE_DIR}/scripts/new-project.cmake
  DEPENDS ${TERRAFORM_TARGETS}
)

message("")
message(STATUS "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --")
message("")
message("Summary:")
message(STATUS "Terraform root:                 ${TERRAFORM_ROOT}/")
message(STATUS "Libraries install directory:    ${TERRAFORM_ROOT}/lib/")
message(STATUS "Library header files:           ${TERRAFORM_ROOT}/include/")

message("")
message("Build targets:")
message("    new-ptoject: Build the target 'new-project' to create projects using this root")
message("              - make new-project PROJECT_NAME=\"New Project\"")
message("")
message("    all: Build the target 'all' to generate only the terraform root")
message("              - make all")
message("")
message("    You can come back later to generate a new project")
message("")
message(STATUS "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --")
message("")
