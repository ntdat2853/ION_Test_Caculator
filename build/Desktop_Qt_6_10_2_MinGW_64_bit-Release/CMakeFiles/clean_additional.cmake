# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles\\appION_Test_Caculator_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appION_Test_Caculator_autogen.dir\\ParseCache.txt"
  "appION_Test_Caculator_autogen"
  )
endif()
