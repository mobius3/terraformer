include(ExternalProject)

if (TARGET openal)
  return()
endif()

message(STATUS "openal will be built.")

if (WIN32)
  ExternalProject_Add(
    openal
    DEPENDS sdl2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL http://kcat.strangesoft.net/openal-binaries/openal-soft-1.17.2-bin.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/src/openal/libs ${TERRAFORM_ROOT}/lib
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/src/openal/include ${TERRAFORM_ROOT}/include
  )
else ()
  ExternalProject_Add(
    openal
    DEPENDS sdl2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    URL http://kcat.strangesoft.net/openal-releases/openal-soft-1.16.0.tar.bz2
    DOWNLOAD_NAME openal.tar.bz2
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${TERRAFORM_ROOT}
  )
endif ()
