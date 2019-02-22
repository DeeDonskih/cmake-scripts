#
# Copyright (C) 2018 by George Cave - gcave@stablecoder.ca
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

#
# clang-tidy
#
option(CLANG_TIDY "Turns on clang-tidy processing if it is found." OFF)

find_program(CLANG_TIDY_EXE NAMES "clang-tidy")
if(CLANG_TIDY_EXE)
  message(STATUS "clang-tidy found: ${CLANG_TIDY_EXE}")
  if(CLANG_TIDY)
    set(
      CMAKE_CXX_CLANG_TIDY
      "${CLANG_TIDY_EXE};-format-style=file;-header-filter='${CMAKE_SOURCE_DIR}/*'"
      CACHE STRING ""
      FORCE)
  else()
    message(STATUS "clang-tidy NOT ENABLED via 'CLANG_TIDY' variable!")
    set(CMAKE_CXX_CLANG_TIDY "" CACHE STRING "" FORCE) # delete it
  endif()
elseif(CLANG_TIDY)
  message(SEND_ERROR "Cannot enable clang-tidy, as executable not found!")
  set(CMAKE_CXX_CLANG_TIDY "" CACHE STRING "" FORCE) # delete it
else()
  message(STATUS "clang-tidy not found!")
  set(CMAKE_CXX_CLANG_TIDY "" CACHE STRING "" FORCE) # delete it
endif()

#
# include what you use
#
option(IWYU "Turns on include-what-you-use processing if it is found." OFF)

find_program(IWYU_EXE NAMES "include-what-you-use")
if(IWYU_EXE)
  message(STATUS "include-what-you-use found: ${IWYU_EXE}")
  if(IWYU)
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "${IWYU_EXE};-Xiwyu;"
        CACHE STRING ""
        FORCE)
  else()
    message(STATUS "include-what-you-use NOT ENABLED via 'IWYU' variable!")
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "" CACHE STRING "" FORCE) # delete it
  endif()
elseif(IWYU)
  message(
    SEND_ERROR "Cannot enable include-what-you-use, as executable not found!")
  set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "" CACHE STRING "" FORCE) # delete it
else()
  message(STATUS "include-what-you-use not found!")
  set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "" CACHE STRING "" FORCE) # delete it
endif()

#
# cppcheck
#
option(CPPCHECK "Turns on cppcheck processing if it is found." OFF)

find_program(CPPCHECK_EXE NAMES "cppcheck")
if(CPPCHECK_EXE)
  message(STATUS "cppcheck found: ${CPPCHECK_EXE}")
  if(CPPCHECK)
    set(
      CMAKE_CXX_CPPCHECK
      "${CPPCHECK_EXE};--enable=warning,performance,portability,missingInclude;--template=\"[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)\";--suppress=missingIncludeSystem;--quiet;--verbose;--force"
      CACHE STRING ""
      FORCE)
  else()
    message(STATUS "cppcheck NOT ENABLED via 'CPPCHECK' variable!")
    set(CMAKE_CXX_CPPCHECK "" CACHE STRING "" FORCE) # delete it
  endif()
elseif(CPPCHECK)
  message(SEND_ERROR "Cannot enable cppcheck, as executable not found!")
  set(CMAKE_CXX_CPPCHECK "" CACHE STRING "" FORCE) # delete it
else()
  message(STATUS "cppcheck not found!")
  set(CMAKE_CXX_CPPCHECK "" CACHE STRING "" FORCE) # delete it
endif()
