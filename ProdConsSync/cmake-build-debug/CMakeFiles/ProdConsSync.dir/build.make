# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /opt/clion-2017.3.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /opt/clion-2017.3.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/CLionProjects/ProdConsSync

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ProdConsSync.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ProdConsSync.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ProdConsSync.dir/flags.make

CMakeFiles/ProdConsSync.dir/main.c.o: CMakeFiles/ProdConsSync.dir/flags.make
CMakeFiles/ProdConsSync.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ProdConsSync.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ProdConsSync.dir/main.c.o   -c /home/ubuntu/CLionProjects/ProdConsSync/main.c

CMakeFiles/ProdConsSync.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ProdConsSync.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/CLionProjects/ProdConsSync/main.c > CMakeFiles/ProdConsSync.dir/main.c.i

CMakeFiles/ProdConsSync.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ProdConsSync.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/CLionProjects/ProdConsSync/main.c -o CMakeFiles/ProdConsSync.dir/main.c.s

CMakeFiles/ProdConsSync.dir/main.c.o.requires:

.PHONY : CMakeFiles/ProdConsSync.dir/main.c.o.requires

CMakeFiles/ProdConsSync.dir/main.c.o.provides: CMakeFiles/ProdConsSync.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/ProdConsSync.dir/build.make CMakeFiles/ProdConsSync.dir/main.c.o.provides.build
.PHONY : CMakeFiles/ProdConsSync.dir/main.c.o.provides

CMakeFiles/ProdConsSync.dir/main.c.o.provides.build: CMakeFiles/ProdConsSync.dir/main.c.o


CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o: CMakeFiles/ProdConsSync.dir/flags.make
CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o: ../quest_arr_handler.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o   -c /home/ubuntu/CLionProjects/ProdConsSync/quest_arr_handler.c

CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/CLionProjects/ProdConsSync/quest_arr_handler.c > CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.i

CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/CLionProjects/ProdConsSync/quest_arr_handler.c -o CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.s

CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.requires:

.PHONY : CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.requires

CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.provides: CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.requires
	$(MAKE) -f CMakeFiles/ProdConsSync.dir/build.make CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.provides.build
.PHONY : CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.provides

CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.provides.build: CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o


CMakeFiles/ProdConsSync.dir/producer.c.o: CMakeFiles/ProdConsSync.dir/flags.make
CMakeFiles/ProdConsSync.dir/producer.c.o: ../producer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/ProdConsSync.dir/producer.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ProdConsSync.dir/producer.c.o   -c /home/ubuntu/CLionProjects/ProdConsSync/producer.c

CMakeFiles/ProdConsSync.dir/producer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ProdConsSync.dir/producer.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/CLionProjects/ProdConsSync/producer.c > CMakeFiles/ProdConsSync.dir/producer.c.i

CMakeFiles/ProdConsSync.dir/producer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ProdConsSync.dir/producer.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/CLionProjects/ProdConsSync/producer.c -o CMakeFiles/ProdConsSync.dir/producer.c.s

CMakeFiles/ProdConsSync.dir/producer.c.o.requires:

.PHONY : CMakeFiles/ProdConsSync.dir/producer.c.o.requires

CMakeFiles/ProdConsSync.dir/producer.c.o.provides: CMakeFiles/ProdConsSync.dir/producer.c.o.requires
	$(MAKE) -f CMakeFiles/ProdConsSync.dir/build.make CMakeFiles/ProdConsSync.dir/producer.c.o.provides.build
.PHONY : CMakeFiles/ProdConsSync.dir/producer.c.o.provides

CMakeFiles/ProdConsSync.dir/producer.c.o.provides.build: CMakeFiles/ProdConsSync.dir/producer.c.o


CMakeFiles/ProdConsSync.dir/consumer.c.o: CMakeFiles/ProdConsSync.dir/flags.make
CMakeFiles/ProdConsSync.dir/consumer.c.o: ../consumer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/ProdConsSync.dir/consumer.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ProdConsSync.dir/consumer.c.o   -c /home/ubuntu/CLionProjects/ProdConsSync/consumer.c

CMakeFiles/ProdConsSync.dir/consumer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ProdConsSync.dir/consumer.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/CLionProjects/ProdConsSync/consumer.c > CMakeFiles/ProdConsSync.dir/consumer.c.i

CMakeFiles/ProdConsSync.dir/consumer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ProdConsSync.dir/consumer.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/CLionProjects/ProdConsSync/consumer.c -o CMakeFiles/ProdConsSync.dir/consumer.c.s

CMakeFiles/ProdConsSync.dir/consumer.c.o.requires:

.PHONY : CMakeFiles/ProdConsSync.dir/consumer.c.o.requires

CMakeFiles/ProdConsSync.dir/consumer.c.o.provides: CMakeFiles/ProdConsSync.dir/consumer.c.o.requires
	$(MAKE) -f CMakeFiles/ProdConsSync.dir/build.make CMakeFiles/ProdConsSync.dir/consumer.c.o.provides.build
.PHONY : CMakeFiles/ProdConsSync.dir/consumer.c.o.provides

CMakeFiles/ProdConsSync.dir/consumer.c.o.provides.build: CMakeFiles/ProdConsSync.dir/consumer.c.o


CMakeFiles/ProdConsSync.dir/proc_handler.c.o: CMakeFiles/ProdConsSync.dir/flags.make
CMakeFiles/ProdConsSync.dir/proc_handler.c.o: ../proc_handler.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/ProdConsSync.dir/proc_handler.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ProdConsSync.dir/proc_handler.c.o   -c /home/ubuntu/CLionProjects/ProdConsSync/proc_handler.c

CMakeFiles/ProdConsSync.dir/proc_handler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ProdConsSync.dir/proc_handler.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/CLionProjects/ProdConsSync/proc_handler.c > CMakeFiles/ProdConsSync.dir/proc_handler.c.i

CMakeFiles/ProdConsSync.dir/proc_handler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ProdConsSync.dir/proc_handler.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/CLionProjects/ProdConsSync/proc_handler.c -o CMakeFiles/ProdConsSync.dir/proc_handler.c.s

CMakeFiles/ProdConsSync.dir/proc_handler.c.o.requires:

.PHONY : CMakeFiles/ProdConsSync.dir/proc_handler.c.o.requires

CMakeFiles/ProdConsSync.dir/proc_handler.c.o.provides: CMakeFiles/ProdConsSync.dir/proc_handler.c.o.requires
	$(MAKE) -f CMakeFiles/ProdConsSync.dir/build.make CMakeFiles/ProdConsSync.dir/proc_handler.c.o.provides.build
.PHONY : CMakeFiles/ProdConsSync.dir/proc_handler.c.o.provides

CMakeFiles/ProdConsSync.dir/proc_handler.c.o.provides.build: CMakeFiles/ProdConsSync.dir/proc_handler.c.o


CMakeFiles/ProdConsSync.dir/py_producer.c.o: CMakeFiles/ProdConsSync.dir/flags.make
CMakeFiles/ProdConsSync.dir/py_producer.c.o: ../py_producer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/ProdConsSync.dir/py_producer.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ProdConsSync.dir/py_producer.c.o   -c /home/ubuntu/CLionProjects/ProdConsSync/py_producer.c

CMakeFiles/ProdConsSync.dir/py_producer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ProdConsSync.dir/py_producer.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/CLionProjects/ProdConsSync/py_producer.c > CMakeFiles/ProdConsSync.dir/py_producer.c.i

CMakeFiles/ProdConsSync.dir/py_producer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ProdConsSync.dir/py_producer.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/CLionProjects/ProdConsSync/py_producer.c -o CMakeFiles/ProdConsSync.dir/py_producer.c.s

CMakeFiles/ProdConsSync.dir/py_producer.c.o.requires:

.PHONY : CMakeFiles/ProdConsSync.dir/py_producer.c.o.requires

CMakeFiles/ProdConsSync.dir/py_producer.c.o.provides: CMakeFiles/ProdConsSync.dir/py_producer.c.o.requires
	$(MAKE) -f CMakeFiles/ProdConsSync.dir/build.make CMakeFiles/ProdConsSync.dir/py_producer.c.o.provides.build
.PHONY : CMakeFiles/ProdConsSync.dir/py_producer.c.o.provides

CMakeFiles/ProdConsSync.dir/py_producer.c.o.provides.build: CMakeFiles/ProdConsSync.dir/py_producer.c.o


# Object files for target ProdConsSync
ProdConsSync_OBJECTS = \
"CMakeFiles/ProdConsSync.dir/main.c.o" \
"CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o" \
"CMakeFiles/ProdConsSync.dir/producer.c.o" \
"CMakeFiles/ProdConsSync.dir/consumer.c.o" \
"CMakeFiles/ProdConsSync.dir/proc_handler.c.o" \
"CMakeFiles/ProdConsSync.dir/py_producer.c.o"

# External object files for target ProdConsSync
ProdConsSync_EXTERNAL_OBJECTS =

ProdConsSync: CMakeFiles/ProdConsSync.dir/main.c.o
ProdConsSync: CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o
ProdConsSync: CMakeFiles/ProdConsSync.dir/producer.c.o
ProdConsSync: CMakeFiles/ProdConsSync.dir/consumer.c.o
ProdConsSync: CMakeFiles/ProdConsSync.dir/proc_handler.c.o
ProdConsSync: CMakeFiles/ProdConsSync.dir/py_producer.c.o
ProdConsSync: CMakeFiles/ProdConsSync.dir/build.make
ProdConsSync: CMakeFiles/ProdConsSync.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C executable ProdConsSync"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ProdConsSync.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ProdConsSync.dir/build: ProdConsSync

.PHONY : CMakeFiles/ProdConsSync.dir/build

CMakeFiles/ProdConsSync.dir/requires: CMakeFiles/ProdConsSync.dir/main.c.o.requires
CMakeFiles/ProdConsSync.dir/requires: CMakeFiles/ProdConsSync.dir/quest_arr_handler.c.o.requires
CMakeFiles/ProdConsSync.dir/requires: CMakeFiles/ProdConsSync.dir/producer.c.o.requires
CMakeFiles/ProdConsSync.dir/requires: CMakeFiles/ProdConsSync.dir/consumer.c.o.requires
CMakeFiles/ProdConsSync.dir/requires: CMakeFiles/ProdConsSync.dir/proc_handler.c.o.requires
CMakeFiles/ProdConsSync.dir/requires: CMakeFiles/ProdConsSync.dir/py_producer.c.o.requires

.PHONY : CMakeFiles/ProdConsSync.dir/requires

CMakeFiles/ProdConsSync.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ProdConsSync.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ProdConsSync.dir/clean

CMakeFiles/ProdConsSync.dir/depend:
	cd /home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/CLionProjects/ProdConsSync /home/ubuntu/CLionProjects/ProdConsSync /home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug /home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug /home/ubuntu/CLionProjects/ProdConsSync/cmake-build-debug/CMakeFiles/ProdConsSync.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ProdConsSync.dir/depend

