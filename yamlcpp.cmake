cmake_minimum_required (VERSION 2.8.8)
include                (ExternalProject)

ExternalProject_Add (yamlcpp
    GIT_REPOSITORY  https://github.com/jbeder/yaml-cpp.git
    GIT_TAG         release-0.5.3
    PREFIX          ${CMAKE_CURRENT_BINARY_DIR}/yaml-cpp
    BUILD_COMMAND   make
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property (yamlcpp source_dir)
set (YAML_CPP_INCLUDE_DIR ${source_dir}/include)

ExternalProject_Get_Property (yamlcpp binary_dir)
set (YAML_CPP_BINARY_DIR ${binary_dir})
