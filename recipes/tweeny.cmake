include(ExternalProject)

if (TARGET tweeny)
  return()
endif()

message(STATUS "tweeny will be build")

ExternalProject_Add(
  tweeny
  PREFIX ${CMAKE_BINARY_DIR}
  INSTALL_DIR ${TERRAFORM_ROOT}
  URL https://github.com/mobius3/tweeny/archive/master.zip
  DOWNLOAD_NAME tweeny-master.zip
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${TERRAFORM_ROOT} -DCMAKE_INSTALL_LIBDIR=lib
)
