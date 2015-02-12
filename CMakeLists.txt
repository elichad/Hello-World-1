# Project name and language(s)
project(Flow123d CXX C Fortran)

cmake_minimum_required(VERSION 2.8.8)

set(CMAKE_MODULE_PATH "${Flow123d_SOURCE_DIR}/CMake/Modules" "${CMAKE_ROOT}/Modules")
set(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")

# include macro
include (Flow123d_config_header)

# define some stuff
flow_define (HAVE_PETSC)
flow_define (DEBUG)
flow_define (COMPILER_FLAGS_ ${CMAKE_CXX_FLAGS})
flow_define (VARIABLE)



include(FindGit)

if (GIT_FOUND)     
  set(GIT_BRANCH "Master" CACHE INTERNAL "Current git branch.")
  set(GIT_DESCRIBE "Last commit" CACHE INTERNAL "Human readable description of last git commit.")
  set(GIT_URL "https://github.com/x3mSpeedy/Hello-World.git" CACHE INTERNAL "URL of remote repository.")
  set(GIT_VERSION_FULL "${GIT_VERSION_MAJOR}.${GIT_VERSION_MINOR}.${GIT_VERSION_PATCH}" CACHE INTERNAL "Full version name.")
endif()



add_custom_target(run_always 
    # COMMAND "echo" "RUNNING add_custom_target"
    COMMAND ${CMAKE_COMMAND} -DFLOW123D_SOURCE_DIR=${CMAKE_SOURCE_DIR} -P ${CMAKE_SOURCE_DIR}/CMake/Modules/Flow123d_config_header_create.cmake)

add_custom_target(rev_num_always 
    COMMAND ${CMAKE_COMMAND} -DFLOW123D_SOURCE_DIR=${CMAKE_SOURCE_DIR} -P ${CMAKE_SOURCE_DIR}/CMake/Modules/Flow123d_git_rev_num.cmake)

# config.h is a generated file
set_source_files_properties(${CMAKE_BINARY_DIR}/config.h PROPERTIES GENERATED TRUE HEADER_FILE_ONLY TRUE)
set_source_files_properties(${CMAKE_BINARY_DIR}/config.h PROPERTIES GENERATED TRUE HEADER_FILE_ONLY TRUE)

# add target
add_executable(bin/flow123d src/main.cc)

# dependencies
add_dependencies(bin/flow123d run_always) 
add_dependencies(run_always rev_num_always) 

install(TARGETS bin/flow123d RUNTIME DESTINATION bin)