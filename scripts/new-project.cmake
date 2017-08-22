cmake_minimum_required(VERSION 3.0)

# Do not allow project named test
string(TOLOWER ${PROJECT_NAME} PROJECT_NAME_LOWERCASE)
if (${PROJECT_NAME_LOWERCASE} STREQUAL "test")
    message(STATUS "'test' is a reserved CMake word and cannot be used as your game/project name.")
    message(STATUS "Please chose another name for your game other than ${PROJECT_NAME}.")
    message(FATAL_ERROR "Unacceptable project name")
endif()

# Produces name that can be a folder
string(MAKE_C_IDENTIFIER ${PROJECT_NAME} GAME_TARGET)
set(PROJECT_ROOT ${TERRAFORM_ROOT}/game/${GAME_TARGET} CACHE PATH "Where the project will be generated")
file(RELATIVE_PATH TERRAFORM_RELATIVE_ROOT ${PROJECT_ROOT} ${TERRAFORM_ROOT})

# Copy skeleton to target
execute_process(COMMAND ${CMAKE_COMMAND} -E copy_directory ${SKEL_DIR} ${PROJECT_ROOT}/)

# Replaces @VAR@ with our ${VAR} in these files
configure_file(${PROJECT_ROOT}/CMakeLists.txt ${PROJECT_ROOT}/CMakeLists.txt @ONLY)
configure_file(${PROJECT_ROOT}/src/CMakeLists.txt ${PROJECT_ROOT}/src/CMakeLists.txt @ONLY)

message("")
message(TERRAFORM "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --")
message("")
message("Summary:")
message(STATUS "Project name:                ${PROJECT_NAME}")
message(STATUS "Project target:              ${GAME_TARGET}")
message(STATUS "Project folder:              ${PROJECT_ROOT}")
message("")
message(TERRAFORM "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --")

