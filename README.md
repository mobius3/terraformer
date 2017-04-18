# Terraform

Terraform is a CMake super-build project to aid in the creation of a suitable development environment. It downloads and builds libraries.

It uses ExternalProject to accomplish this via a series of scripts or recipes that contains the required commands to build all dependencies.

# Usage

Clone this repository:
    
    git clone git@github.com:mobius3/terraform.git
    
Create a build folder inside
    
    cd terraform
    mkdir build
    cd build
    
Run `cmake ..` passing a list of targets that needs to be build:

    cmake .. -DTERRAFORM_TARGETS="sdl2;sdl2-image;glm"
    
Run make:

    make
    
This will download and build all targets listed, and install to the parent directory of the root dir. You can change this by passing the argument `TERRAFORM_ROOT`:

    cmake .. -DTERRAFORM_TARGETS="sdl2;sdl2-image;glm" -DTERRAFORM_ROOT=/tmp/terraform