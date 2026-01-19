#!/bin/bash

# Directories to wipe
BUILD_DIR="build"
VCPKG_INSTALLED="vcpkg_installed"

echo "--- Cleaning Project ---"

# 1. Remove CMake build artifacts
if [ -d "$BUILD_DIR" ]; then
    echo "Removing $BUILD_DIR..."
    rm -rf "$BUILD_DIR"
fi

# 2. Remove vcpkg's installed binaries (the heavy stuff)
if [ -d "$VCPKG_INSTALLED" ]; then
    echo "Removing $VCPKG_INSTALLED..."
    rm -rf "$VCPKG_INSTALLED"
fi

# 3. Clean inside the vcpkg submodule (Optional but keeps it small)
# We delete downloads and build logs, but keep the submodule itself.
if [ -d "vcpkg" ]; then
    echo "Cleaning vcpkg temporary files..."
    rm -rf vcpkg/downloads/*
    rm -rf vcpkg/buildtrees/*
    rm -rf vcpkg/packages/*
    # Optional: remove the vcpkg binary itself to force a re-bootstrap
    # rm -f vcpkg/vcpkg 
fi

echo "--- Clean Complete! ---"