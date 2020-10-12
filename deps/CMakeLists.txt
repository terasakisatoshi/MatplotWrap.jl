project(CppHello)

cmake_minimum_required(VERSION 3.14)
set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(JlCxx)
get_target_property(JlCxx_location JlCxx::cxxwrap_julia LOCATION)
get_filename_component(JlCxx_location ${JlCxx_location} DIRECTORY)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;${JlCxx_location}")

message(STATUS "Found JlCxx at ${JlCxx_location}")

add_subdirectory(matplotplusplus)

# mplxx.cpp
add_library(mplxx SHARED mplxx.cpp)
target_link_libraries(mplxx JlCxx::cxxwrap_julia JlCxx::cxxwrap_julia_stl ${Julia_LIBRARY} matplot)

install(TARGETS
  mplxx
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib
RUNTIME DESTINATION lib)
