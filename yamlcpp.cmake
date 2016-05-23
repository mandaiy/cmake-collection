# following cmake variables are set for using in your cmake files:
#  ${YAML_CPP_PROJECT_NAME}: project name of yamlcpp
#                            you can use this for dependency configuration for example
#  ${YAML_CPP_INCLUDE_DIR}:  header file direcotry of yamlcpp
#  ${YAML_CPP_BINARY_DIR}:   binary directory of yamlcpp
#                            the library and test executables are supposed to be stored in
#
# To link yamlcpp you need to add line 'link_directories (${YAML_CPP_BINARY_DIR})'
# To include yamlcpp header files you need to add line
#   'include_directories(${YAML_CPP_INCLUDE_DIR})'

cmake_minimum_required (VERSION 2.8.8)
include                (ExternalProject)

set (YAML_CPP_PROJECT_NAME yamlcpp)
set (YAML_CPP_LIBRARY_NAME yaml-cpp)

ExternalProject_Add (${YAML_CPP_PROJECT_NAME}
    GIT_REPOSITORY  https://github.com/jbeder/yaml-cpp.git
    GIT_TAG         release-0.5.3
    PREFIX          ${CMAKE_CURRENT_BINARY_DIR}/yaml-cpp
    BUILD_COMMAND   make
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property (${YAML_CPP_PROJECT_NAME} source_dir)
set (YAML_CPP_INCLUDE_DIR ${source_dir}/include)

ExternalProject_Get_Property (${YAML_CPP_PROJECT_NAME} binary_dir)
set (YAML_CPP_BINARY_DIR ${binary_dir})
