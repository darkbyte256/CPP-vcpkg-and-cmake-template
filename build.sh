#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- Git Submodule Check ---
if [ ! -f "vcpkg/README.md" ]; then
    echo "--- vcpkg not found. Initializing submodules... ---"
    git submodule update --init --recursive
fi

# --- vcpkg Bootstrapping Check ---
if [ ! -f "./vcpkg/vcpkg" ]; then
    echo "--- Bootstrapping vcpkg ---"
    ./vcpkg/bootstrap-vcpkg.sh
fi

# --- Configuration ---
# Adjust this if your vcpkg folder is in a different location
VCPKG_PATH="./vcpkg/scripts/buildsystems/vcpkg.cmake"
BUILD_DIR="build"

# Check if vcpkg toolchain exists
if [ ! -f "$VCPKG_PATH" ]; then
    echo "Error: vcpkg toolchain not found at $VCPKG_PATH"
    echo "Please ensure you have cloned vcpkg into the project root."
    exit 1
fi

# 1. Create build directory if it doesn't exist
if [ ! -d "$BUILD_DIR" ]; then
    echo "--- Creating build directory ---"
    mkdir "$BUILD_DIR"
fi

# 2. Enter build directory
cd "$BUILD_DIR"

# 3. Configure the project with CMake
echo "--- Configuring Project with Clang and vcpkg ---"
cmake .. \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_TOOLCHAIN_FILE="../$VCPKG_PATH"

# 4. Build the application
echo "--- Building Application ---"
cmake --build .

echo "--- Build Complete! ---"
echo "You can run your app with: ./$BUILD_DIR/app"