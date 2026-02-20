# Cpp-Vcpkg-CMake-Template

A professional-grade boilerplate for high-performance C++ applications. This template provides a robust, reproducible environment for building modern C++ systems, simulations, or high-throughput data tools using industry-standard tooling.

## 🚀 Overview

This repository standardizes the development lifecycle for C++ projects. It leverages **CMake** for cross-platform builds and **vcpkg (Manifest Mode)** for dependency management, ensuring that every developer on the team has the exact same library versions.

### Key Features
- **Modern C++ Standards:** Pre-configured for **C++20/C++23** to utilize concepts, ranges, and modules.
- **Reproducible Dependencies:** Uses `vcpkg.json` to lock library versions and simplify setup.
- **Clang++ Integration:** Optimized for `clang++` to benefit from advanced diagnostics and memory sanitizers.
- **Production-Ready Scripts:** Includes automated bootstrapping for vcpkg and clean-build workflows.
- **Graphics Smoke-Test:** Includes a minimal OpenGL implementation to verify that the C++ compiler, linker, and graphics drivers are correctly configured.

## 🛠️ Project Structure
```text
├── build.sh          # Automated bootstrap & build script
├── clean.sh          # Full cleanup of build artifacts and vcpkg cache
├── CMakeLists.txt    # Modern CMake (C++ targeted)
├── vcpkg.json        # C++ Dependency manifest
├── include/          # Header-only utilities and declarations
└── src/              # C++ source files (.cpp)
```

## 🚦 Getting Started

### Prerequisites
- **CMake** (3.15+)
- **Clang++** (12+) or **G++** (11+)
- **Git**
- **System Dependencies** (for the OpenGL smoke-test):
  - Ubuntu/Debian: `sudo apt install libx11-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev libgl1-mesa-dev`

### Setup & Build
The `build.sh` script automates the toolchain setup:

```bash
chmod +x build.sh
./build.sh
```

### Running the Verification App
Execute the compiled binary to verify the environment:
```bash
./build/app
```

## 🔧 Customization
1. Update `project(YourProjectName CXX)` in `CMakeLists.txt`.
2. Add your C++ libraries (e.g., `fmt`, `nlohmann-json`, `boost`) to `vcpkg.json`.
3. Re-run `./build.sh`.

---
*Maintained by Ramy Abdallah Mohamed.*
