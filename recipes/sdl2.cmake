include(ExternalProject)

if (TARGET sdl2)
  return()
endif()

message(STATUS "sdl2 will be built.")

# For win32 is better to download just the binaries.
if (WIN32)
  # Get SDL2 dev package
  ExternalProject_Add(
    sdl2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL http://libsdl.org/release/SDL2-devel-2.0.8-VC.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/src/sdl2/lib ${TERRAFORM_ROOT}/lib
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/src/sdl2/include ${TERRAFORM_ROOT}/include/SDL2
  )
else () # Now, if using anything else, get the sources.
  # Build SDL2
  ExternalProject_Add(
    sdl2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL http://libsdl.org/release/SDL2-2.0.8.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${TERRAFORM_ROOT}
  )
endif ()
