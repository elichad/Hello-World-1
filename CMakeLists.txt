# Project name and language(s)
project(Flow123d CXX C Fortran)

cmake_minimum_required(VERSION 2.8.8)

set(CMAKE_MODULE_PATH "${Flow123d_SOURCE_DIR}/CMake/Modules" "${CMAKE_ROOT}/Modules")
set(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")


include (Flow123d_config_header)

flow_define (HAVE_PETSC)
flow_define (DEBUG)
flow_define (COMPILER_FLAGS_ ${CMAKE_CXX_FLAGS})