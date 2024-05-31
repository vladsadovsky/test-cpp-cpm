#!/bin/bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

mkdir -p build/debug
mkdir -p build/release

# Configure a debug build native
cmake -S . -B build/debug/x64 -D CMAKE_BUILD_TYPE=Debug
# build the debug binaries native
cmake --build build/debug/x64

# Configure a debug build ARM64
 cmake -S . -B build/debug/arm64 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=platforms/linux/aarch64-gnu.toolchain.cmake
# build the debug binaries ARM64
cmake --build build/debug/arm64 --verbose


# Configure a release build
cmake -S . -B build/release/x64 -D CMAKE_BUILD_TYPE=Release
# Build release binaries
cmake --build build/release/x64

# Configure a release build
cmake -S . -B build/release/arm64 -D CMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=platforms/linux/aarch64-gnu.toolchain.cmake
# Build release binaries
cmake --build build/release/arm64