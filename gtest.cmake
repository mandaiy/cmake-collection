cmake_minimum_required (VERSION 2.8.8)
include                (ExternalProject)

ExternalProject_Add (googletest
    GIT_REPOSITORY  https://github.com/google/googletest.git
    GIT_TAG         release-1.7.0
    CMAKE_ARGS      -Dgtest_force_shared_crt=ON
    PREFIX          ${CMAKE_CURRENT_BINARY_DIR}/gtest
    INSTALL_COMMAND "" # Disable install step
)

# Specify include dir
ExternalProject_Get_Property (googletest source_dir)
set (GTEST_INCLUDE_DIRS ${source_dir}/include)

# Specify MainTest's link libraries
ExternalProject_Get_Property (googletest binary_dir)
set (GTEST_LIBS_DIR ${binary_dir})

