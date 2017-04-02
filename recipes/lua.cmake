include(ExternalProject)

if (TARGET lua)
  return()
endif()

message(STATUS "lua will be built")

set(ENV{LUA_DIR} ${TERRAFORM_ROOT})
ExternalProject_Add(
  lua
  PREFIX ${CMAKE_BINARY_DIR}
  INSTALL_DIR ${TERRAFORM_ROOT}
  URL https://github.com/LuaDist/lua/archive/master.zip
  DOWNLOAD_NAME lua-master.zip
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${TERRAFORM_ROOT} -DBUILD_SHARED_LIBS=FALSE
)
