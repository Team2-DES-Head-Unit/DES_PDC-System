# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/HeadUnit_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/HeadUnit_autogen.dir/ParseCache.txt"
  "HeadUnit_autogen"
  )
endif()
