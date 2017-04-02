include(ExternalProject)

if (TARGET glm)
  return()
endif()

message(STATUS "glm will be build")

ExternalProject_Add(
  glm
  PREFIX ${CMAKE_BINARY_DIR}
  INSTALL_DIR ${TERRAFORM_ROOT}
  URL https://github.com/g-truc/glm/archive/master.zip
  DOWNLOAD_NAME glm-master.zip
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${TERRAFORM_ROOT} -DCMAKE_INSTALL_LIBDIR=lib
)
