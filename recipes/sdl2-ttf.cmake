include(ExternalProject)

if (TARGET sdl2-ttf)
  return()
endif()

include(recipes/sdl2.cmake)
message(STATUS "sdl2-ttf will be built.")

if (WIN32)
  # Get SDL2 TTF dev package
  ExternalProject_Add(
    sdl2-ttf
    DEPENDS sdl2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_ttf/release/SDL2_ttf-devel-2.0.12-VC.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/src/sdl2-ttf/lib ${TERRAFORM_ROOT}/lib
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/src/sdl2-ttf/include ${TERRAFORM_ROOT}/include/SDL2
  )
else ()
  # Build sdl2-ttf
  ExternalProject_Add(
    freetype2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    URL http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.gz
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${TERRAFORM_ROOT}
  )

  ExternalProject_Add(
    sdl2-ttf
    DEPENDS freetype2 sdl2
    PREFIX ${CMAKE_BINARY_DIR}
    INSTALL_DIR ${TERRAFORM_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.12.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${TERRAFORM_ROOT} --with-freetype-prefix=${TERRAFORM_ROOT}
  )
endif ()
