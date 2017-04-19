#https://github.com/nlohmann/json/releases/download/v2.1.1/json.hpp
include(ExternalProject)

if (TARGET json)
  return()
endif()

message(STATUS "json will be build")

ExternalProject_Add(
  json
  PREFIX ${CMAKE_BINARY_DIR}
  INSTALL_DIR ${TERRAFORM_ROOT}
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  URL https://github.com/nlohmann/json/releases/download/v2.1.1/json.hpp
  DOWNLOAD_NAME json.hpp
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  DOWNLOAD_NO_EXTRACT 1
  INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E make_directory ${TERRAFORM_ROOT}/include
    COMMAND ${CMAKE_COMMAND} -E copy  <DOWNLOADED_FILE> ${TERRAFORM_ROOT}/include

)