cmake_minimum_required(VERSION "2.8.4")

set(project_name "yatla")
set(yatla_VERSION "0.1.0")
set(required_pkgs
  "gee-0.8"
  "gio-2.0"
  "glib-2.0"
  "gobject-2.0"
  "granite"
  "gtk+-3.0"
  "libnotify"
  "sqlheavy-0.1"
)
set(srcfiles
  "src/Yatla.vala"
  "src/Database.vala"
  "src/DateTime.vala"
  "src/Layout.vala"
  "src/Task.vala"
  "src/Widgets/Preferences.vala"
  "src/Widgets/Sidebar.vala"
  "src/Widgets/TaskPreferences.vala"
  "src/Widgets/Toolbar.vala"
)
set(vapifiles
  "vapi/config.vapi"
)

include("${CMAKE_SOURCE_DIR}/cmake/Common.cmake")

project("${project_name}" C)
string(TOLOWER "${project_name}" project_name_lower)

set(bindir "bin")
set(datarootdir "share")
set(libdir "lib")
set(includedir "include")
set(datadir "${datarootdir}/${project_name_lower}")
if(CMAKE_INSTALL_PREFIX)
  set(install_prefix "${CMAKE_INSTALL_PREFIX}/")
else()
  set(install_prefix)
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/vala")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")


find_package(Vala "0.22" REQUIRED)

# Custom library version checks.
set(definitions)
set(vapidirs)
find_package(PkgConfig)
# config
list(REMOVE_ITEM required_pkgs "config {nocheck,nolink}")
# glib-2.0
pkg_check_modules(GLIB2.0 REQUIRED "glib-2.0")


set(default_vala_flags
  "--thread"
  "--target-glib" "${GLIB2.0_VERSION}"
  #"--enable-experimental"
  #"--fatal-warnings"
)

include(ValaPkgs)
vala_pkgs(VALA_C
  PACKAGES
    ${required_pkgs}
  DEFINITIONS
    ${definitions}
  OPTIONAL
    ${optional_pkgs}
  SRCFILES
    ${srcfiles}
  VAPIS
    ${vapifiles}
  OPTIONS
    ${default_vala_flags}
    ${vapidirs}
)


# Set common C-macros.
add_definitions(-DPACKAGE_NAME="${project_name}")
add_definitions(-DPACKAGE_VERSION="${${project_name}_VERSION}")
if(project_root)
  add_definitions(-DGETTEXT_PACKAGE="${project_root}")
else()
  add_definitions(-DGETTEXT_PACKAGE="${project_name_lower}")
endif()
add_definitions(-DPACKAGE_DATA_DIR="${install_prefix}${datadir}")
add_definitions(-DLOCALE_DIR="${install_prefix}${localedir}")
add_definitions(-DVALA_VERSION="${VALA_SHORTVER}")
add_definitions(-w) # Disable gcc warnings


add_executable("${project_name_lower}" ${VALA_C})
target_link_libraries("${project_name_lower}"
  ${PROJECT_LDFLAGS}
)
add_definitions(
  ${PROJECT_C_FLAGS}
)
install(TARGETS ${project_name_lower} DESTINATION "${bindir}")

# Print some information about build.
datestring(current_date "%F %T")
message("")
message("---------------------------------------------")
message("                          ${current_date}")
message("${project_name} ${${project_name}_VERSION}")
message("")
if(CMAKE_BUILD_TYPE)
  message("Build type: ${CMAKE_BUILD_TYPE}")
  string(TOUPPER "${CMAKE_BUILD_TYPE}" release_upper)
  set(c_flags "${CMAKE_C_FLAGS_${release_upper}}")
else()
  message("Build type: Default")
  set(c_flags "${CMAKE_C_FLAGS}")
endif()
message("")
message("Installation prefix:    ${CMAKE_INSTALL_PREFIX}")
foreach(def ${definitions})
  list(APPEND default_vala_flags "-D;${def}")
endforeach()
base_list_to_delimited_string(vala_flags
  DELIM " "
  BASE_LIST "${default_vala_flags}"
)
message("C compiler:             ${CMAKE_C_COMPILER}")
message("C compiler version      ${CMAKE_C_COMPILER_VERSION}")
if("${c_flags}" STREQUAL "")
  set(c_flags "(none)")
endif()
message("C flags:                ${c_flags}")
message("Vala compiler:          ${VALA_EXECUTABLE}")
message("Vala compiler version:  ${VALA_VERSION}")
if("${vala_flags}" STREQUAL "")
  set(vala_flags "(none)")
endif()
message("Vala flags:             ${vala_flags}")
message("GLib version:           ${GLIB2.0_VERSION}")
message("")
if(GETTEXT_PACKAGE_NAME)
  if(GETTEXT_PACKAGE_VERSION)
    message("Gettext package:        ${GETTEXT_PACKAGE_NAME} (${GETTEXT_PACKAGE_VERSION})")
  else()
    message("Gettext package:        ${GETTEXT_PACKAGE_NAME}")
  endif()
endif()
if(CMAKE_VERBOSE_MAKEFILE)
  message("Verbose build:          yes")
else()
  message("Verbose build:          no")
endif()
message("")
message("---------------------------------------------")
message("")

# vim: set ai ts=2 sts=2 et sw=2
