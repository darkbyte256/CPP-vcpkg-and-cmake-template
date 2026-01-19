cmake_minimum_required(VERSION 3.10)
project(App C)

# Set Policy CMP0072 to NEW to use the modern GLVND libraries (removes that warning)
cmake_policy(SET CMP0072 NEW)

# 1. Find the required packages using the names vcpkg confirmed
find_package(GLEW CONFIG REQUIRED)  # Using CONFIG mode for vcpkg
find_package(glfw3 CONFIG REQUIRED)
find_package(OpenGL REQUIRED)

include_directories(include)

set(SOURCES 
    src/main.c
    src/util.c)

# 2. Add your executable
add_executable(app ${SOURCES})

# 3. Link using the exact target names from the vcpkg output
target_link_libraries(app PRIVATE 
    GLEW::GLEW     # Note: Uppercase is usually required for the vcpkg target
    glfw           # vcpkg confirmed this is just 'glfw'
    OpenGL::GL     # Standard modern OpenGL target
)