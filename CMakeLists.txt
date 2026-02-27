cmake_minimum_required(VERSION 3.10)
project(App CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Set Policy CMP0072 to NEW to use the modern GLVND libraries
cmake_policy(SET CMP0072 NEW)

# 1. Find the required packages using the names vcpkg confirmed
find_package(GLEW CONFIG REQUIRED)  # Using CONFIG mode for vcpkg
find_package(glfw3 CONFIG REQUIRED)
find_package(OpenGL REQUIRED)

include_directories(include)

set(SOURCES 
    src/main.cpp
    src/util.cpp)

# --- GCC Security & "Unfaulty" Hardening ---

# Release: Security + Performance
set(SEC_FLAGS "-fstack-protector-strong -D_FORTIFY_SOURCE=2 -fPIE -pie -Wformat -Wformat-security -D_GLIBCXX_ASSERTIONS")
set(LD_FLAGS "-Wl,-z,relro,-z,now -s")

set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 ${SEC_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${LD_FLAGS}")

# Debug: Bug Catching (Sanitizers)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -Og -Wall -Wextra -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer")

# 2. Add your executable
add_executable(app ${SOURCES})

# 3. Link using the exact target names from the vcpkg output
target_link_libraries(app PRIVATE 
    GLEW::GLEW     
    glfw
    OpenGL::GL
)
