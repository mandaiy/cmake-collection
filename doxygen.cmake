cmake_minimum_required (VERSION 2.8.8)

find_package (Doxygen)

option (DOXYGEN_ENABLED "Create HTML documentation with Doxygen" ${DOXYGEN_FOUND})

if (DOXYGEN_ENABLED)
    # assume you have 'Doxyfile.in' in your root directory
    set (doxyfile_in ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in)
    set (doxyfile    ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    # @ONLY: Restrict variable replacement to references of the form @VAR@
    configure_file (${doxyfile_in} ${doxyfile} @ONLY)

    add_custom_target (doc
        COMMAND ${DOXYGEN_EXECUTABLE} ${doxyfile}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating HTML documentation with Doxygen"
        VERTAIM)
endif()
