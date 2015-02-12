# CMake script for creating config header file

# write definitions
MESSAGE (STATUS "CREATING CONFIG.H")

# append git info to already created tmp file
FILE (APPEND ${CMAKE_BINARY_DIR}/config.h.tmp "#define _GIT_REVISION_ \"${GIT_DESCRIBE}\"\n")
FILE (APPEND ${CMAKE_BINARY_DIR}/config.h.tmp "#define _GIT_BRANCH_ \"${GIT_BRANCH}\"\n")
FILE (APPEND ${CMAKE_BINARY_DIR}/config.h.tmp "#define _GIT_URL_ \"${GIT_URL}\"\n")
FILE (APPEND ${CMAKE_BINARY_DIR}/config.h.tmp "#define _VERSION_NAME_ \"${GIT_VERSION_FULL}\"\n")

# copy the file to the final header only if the version changes
# reduces needless rebuilds
execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_BINARY_DIR}/config.h.tmp config.h)
execute_process(COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_BINARY_DIR}/config.h.tmp)