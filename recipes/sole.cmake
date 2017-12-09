include(ExternalProject)

if (TARGET sole)
  return()
endif()

message(STATUS "sole will be installed")

ExternalProject_Add(
  sole
  PREFIX ${CMAKE_BINARY_DIR}
  INSTALL_DIR ${TERRAFORM_ROOT}
  URL https://github.com/r-lyeh/sole/archive/master.zip
  DOWNLOAD_NAME sole-master.zip
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/sole/sole.hpp ${TERRAFORM_ROOT}/include
)
