#Copyright (c) Microsoft. All rights reserved.
#Licensed under the MIT license. See LICENSE file in the project root for full license information.

cmake_minimum_required(VERSION 2.8.11 FATAL_ERROR)

# Use @rpath in a target’s install name
if(POLICY CMP0042)
  cmake_policy(SET CMP0042 NEW)
endif()

# Specify a VERSION in the project() command
if(POLICY CMP0048)
  cmake_policy(SET CMP0048 NEW)
endif()

option(BUILD_SHARED_LIBS "Build shared libraries rather than static" ON)

project(testrunnerswitcher VERSION 1.1.19)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Use solution folders in Visual Studio
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Build

set(c_files
    src/testmutex.c)

set(h_files
    inc/macro_utils.h
    inc/testmutex.h
    inc/testrunnerswitcher.h)

include_directories(inc)

include(CompilerFlags)

add_library(testrunnerswitcher ${c_files})

set_target_properties(testrunnerswitcher PROPERTIES FOLDER "test_tools") 

# Install

include(GNUInstallDirs) # Set CMAKE_INSTALL_<dir>

if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
    set(CMAKE_INSTALL_LIBDIR "lib")
endif()

configure_file("configs/${PROJECT_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
    COPYONLY)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion)

install(TARGETS testrunnerswitcher EXPORT testrunnerswitcherTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(FILES ${h_files}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(EXPORT testrunnerswitcherTargets
    FILE "${PROJECT_NAME}Targets.cmake"
    DESTINATION cmake)
install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
    DESTINATION cmake)
