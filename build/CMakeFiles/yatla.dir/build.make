# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/denis631/yatla

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/denis631/yatla/build

# Include any dependencies generated for this target.
include CMakeFiles/yatla.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/yatla.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/yatla.dir/flags.make

src/Yatla.c: vala.stamp

src/Database.c: src/Yatla.c

src/DateTime.c: src/Yatla.c

src/Layout.c: src/Yatla.c

src/Task.c: src/Yatla.c

src/Widgets/Preferences.c: src/Yatla.c

src/Widgets/Sidebar.c: src/Yatla.c

src/Widgets/TaskPreferences.c: src/Yatla.c

src/Widgets/Toolbar.c: src/Yatla.c

vala.stamp: ../src/Yatla.vala
vala.stamp: ../src/Database.vala
vala.stamp: ../src/DateTime.vala
vala.stamp: ../src/Layout.vala
vala.stamp: ../src/Task.vala
vala.stamp: ../src/Widgets/Preferences.vala
vala.stamp: ../src/Widgets/Sidebar.vala
vala.stamp: ../src/Widgets/TaskPreferences.vala
vala.stamp: ../src/Widgets/Toolbar.vala
vala.stamp: ../vapi/config.vapi
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating src/Yatla.c, src/Database.c, src/DateTime.c, src/Layout.c, src/Task.c, src/Widgets/Preferences.c, src/Widgets/Sidebar.c, src/Widgets/TaskPreferences.c, src/Widgets/Toolbar.c"
	/usr/bin/valac -C -b /home/denis631/yatla -d /home/denis631/yatla/build --pkg=gee-0.8 --pkg=gio-2.0 --pkg=glib-2.0 --pkg=gobject-2.0 --pkg=granite --pkg=gtk+-3.0 --pkg=libnotify --pkg=sqlheavy-0.1 --thread --target-glib 2.40.0 /home/denis631/yatla/src/Yatla.vala /home/denis631/yatla/src/Database.vala /home/denis631/yatla/src/DateTime.vala /home/denis631/yatla/src/Layout.vala /home/denis631/yatla/src/Task.vala /home/denis631/yatla/src/Widgets/Preferences.vala /home/denis631/yatla/src/Widgets/Sidebar.vala /home/denis631/yatla/src/Widgets/TaskPreferences.vala /home/denis631/yatla/src/Widgets/Toolbar.vala /home/denis631/yatla/vapi/config.vapi
	/usr/bin/cmake -E touch vala.stamp

CMakeFiles/yatla.dir/src/Yatla.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Yatla.c.o: src/Yatla.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Yatla.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Yatla.c.o   -c /home/denis631/yatla/build/src/Yatla.c

CMakeFiles/yatla.dir/src/Yatla.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Yatla.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Yatla.c > CMakeFiles/yatla.dir/src/Yatla.c.i

CMakeFiles/yatla.dir/src/Yatla.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Yatla.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Yatla.c -o CMakeFiles/yatla.dir/src/Yatla.c.s

CMakeFiles/yatla.dir/src/Yatla.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Yatla.c.o.requires

CMakeFiles/yatla.dir/src/Yatla.c.o.provides: CMakeFiles/yatla.dir/src/Yatla.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Yatla.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Yatla.c.o.provides

CMakeFiles/yatla.dir/src/Yatla.c.o.provides.build: CMakeFiles/yatla.dir/src/Yatla.c.o

CMakeFiles/yatla.dir/src/Database.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Database.c.o: src/Database.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Database.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Database.c.o   -c /home/denis631/yatla/build/src/Database.c

CMakeFiles/yatla.dir/src/Database.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Database.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Database.c > CMakeFiles/yatla.dir/src/Database.c.i

CMakeFiles/yatla.dir/src/Database.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Database.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Database.c -o CMakeFiles/yatla.dir/src/Database.c.s

CMakeFiles/yatla.dir/src/Database.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Database.c.o.requires

CMakeFiles/yatla.dir/src/Database.c.o.provides: CMakeFiles/yatla.dir/src/Database.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Database.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Database.c.o.provides

CMakeFiles/yatla.dir/src/Database.c.o.provides.build: CMakeFiles/yatla.dir/src/Database.c.o

CMakeFiles/yatla.dir/src/DateTime.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/DateTime.c.o: src/DateTime.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/DateTime.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/DateTime.c.o   -c /home/denis631/yatla/build/src/DateTime.c

CMakeFiles/yatla.dir/src/DateTime.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/DateTime.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/DateTime.c > CMakeFiles/yatla.dir/src/DateTime.c.i

CMakeFiles/yatla.dir/src/DateTime.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/DateTime.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/DateTime.c -o CMakeFiles/yatla.dir/src/DateTime.c.s

CMakeFiles/yatla.dir/src/DateTime.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/DateTime.c.o.requires

CMakeFiles/yatla.dir/src/DateTime.c.o.provides: CMakeFiles/yatla.dir/src/DateTime.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/DateTime.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/DateTime.c.o.provides

CMakeFiles/yatla.dir/src/DateTime.c.o.provides.build: CMakeFiles/yatla.dir/src/DateTime.c.o

CMakeFiles/yatla.dir/src/Layout.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Layout.c.o: src/Layout.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Layout.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Layout.c.o   -c /home/denis631/yatla/build/src/Layout.c

CMakeFiles/yatla.dir/src/Layout.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Layout.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Layout.c > CMakeFiles/yatla.dir/src/Layout.c.i

CMakeFiles/yatla.dir/src/Layout.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Layout.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Layout.c -o CMakeFiles/yatla.dir/src/Layout.c.s

CMakeFiles/yatla.dir/src/Layout.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Layout.c.o.requires

CMakeFiles/yatla.dir/src/Layout.c.o.provides: CMakeFiles/yatla.dir/src/Layout.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Layout.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Layout.c.o.provides

CMakeFiles/yatla.dir/src/Layout.c.o.provides.build: CMakeFiles/yatla.dir/src/Layout.c.o

CMakeFiles/yatla.dir/src/Task.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Task.c.o: src/Task.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Task.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Task.c.o   -c /home/denis631/yatla/build/src/Task.c

CMakeFiles/yatla.dir/src/Task.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Task.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Task.c > CMakeFiles/yatla.dir/src/Task.c.i

CMakeFiles/yatla.dir/src/Task.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Task.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Task.c -o CMakeFiles/yatla.dir/src/Task.c.s

CMakeFiles/yatla.dir/src/Task.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Task.c.o.requires

CMakeFiles/yatla.dir/src/Task.c.o.provides: CMakeFiles/yatla.dir/src/Task.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Task.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Task.c.o.provides

CMakeFiles/yatla.dir/src/Task.c.o.provides.build: CMakeFiles/yatla.dir/src/Task.c.o

CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o: src/Widgets/Preferences.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o   -c /home/denis631/yatla/build/src/Widgets/Preferences.c

CMakeFiles/yatla.dir/src/Widgets/Preferences.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Widgets/Preferences.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Widgets/Preferences.c > CMakeFiles/yatla.dir/src/Widgets/Preferences.c.i

CMakeFiles/yatla.dir/src/Widgets/Preferences.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Widgets/Preferences.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Widgets/Preferences.c -o CMakeFiles/yatla.dir/src/Widgets/Preferences.c.s

CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.requires

CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.provides: CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.provides

CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.provides.build: CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o

CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o: src/Widgets/Sidebar.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o   -c /home/denis631/yatla/build/src/Widgets/Sidebar.c

CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Widgets/Sidebar.c > CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.i

CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Widgets/Sidebar.c -o CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.s

CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.requires

CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.provides: CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.provides

CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.provides.build: CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o

CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o: src/Widgets/TaskPreferences.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o   -c /home/denis631/yatla/build/src/Widgets/TaskPreferences.c

CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Widgets/TaskPreferences.c > CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.i

CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Widgets/TaskPreferences.c -o CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.s

CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.requires

CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.provides: CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.provides

CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.provides.build: CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o

CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o: CMakeFiles/yatla.dir/flags.make
CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o: src/Widgets/Toolbar.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/denis631/yatla/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o   -c /home/denis631/yatla/build/src/Widgets/Toolbar.c

CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/denis631/yatla/build/src/Widgets/Toolbar.c > CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.i

CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/denis631/yatla/build/src/Widgets/Toolbar.c -o CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.s

CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.requires:
.PHONY : CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.requires

CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.provides: CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.requires
	$(MAKE) -f CMakeFiles/yatla.dir/build.make CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.provides.build
.PHONY : CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.provides

CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.provides.build: CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o

# Object files for target yatla
yatla_OBJECTS = \
"CMakeFiles/yatla.dir/src/Yatla.c.o" \
"CMakeFiles/yatla.dir/src/Database.c.o" \
"CMakeFiles/yatla.dir/src/DateTime.c.o" \
"CMakeFiles/yatla.dir/src/Layout.c.o" \
"CMakeFiles/yatla.dir/src/Task.c.o" \
"CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o" \
"CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o" \
"CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o" \
"CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o"

# External object files for target yatla
yatla_EXTERNAL_OBJECTS =

yatla: CMakeFiles/yatla.dir/src/Yatla.c.o
yatla: CMakeFiles/yatla.dir/src/Database.c.o
yatla: CMakeFiles/yatla.dir/src/DateTime.c.o
yatla: CMakeFiles/yatla.dir/src/Layout.c.o
yatla: CMakeFiles/yatla.dir/src/Task.c.o
yatla: CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o
yatla: CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o
yatla: CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o
yatla: CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o
yatla: CMakeFiles/yatla.dir/build.make
yatla: CMakeFiles/yatla.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable yatla"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yatla.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/yatla.dir/build: yatla
.PHONY : CMakeFiles/yatla.dir/build

CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Yatla.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Database.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/DateTime.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Layout.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Task.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Widgets/Preferences.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Widgets/Sidebar.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Widgets/TaskPreferences.c.o.requires
CMakeFiles/yatla.dir/requires: CMakeFiles/yatla.dir/src/Widgets/Toolbar.c.o.requires
.PHONY : CMakeFiles/yatla.dir/requires

CMakeFiles/yatla.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/yatla.dir/cmake_clean.cmake
.PHONY : CMakeFiles/yatla.dir/clean

CMakeFiles/yatla.dir/depend: src/Yatla.c
CMakeFiles/yatla.dir/depend: src/Database.c
CMakeFiles/yatla.dir/depend: src/DateTime.c
CMakeFiles/yatla.dir/depend: src/Layout.c
CMakeFiles/yatla.dir/depend: src/Task.c
CMakeFiles/yatla.dir/depend: src/Widgets/Preferences.c
CMakeFiles/yatla.dir/depend: src/Widgets/Sidebar.c
CMakeFiles/yatla.dir/depend: src/Widgets/TaskPreferences.c
CMakeFiles/yatla.dir/depend: src/Widgets/Toolbar.c
CMakeFiles/yatla.dir/depend: vala.stamp
	cd /home/denis631/yatla/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/denis631/yatla /home/denis631/yatla /home/denis631/yatla/build /home/denis631/yatla/build /home/denis631/yatla/build/CMakeFiles/yatla.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/yatla.dir/depend

