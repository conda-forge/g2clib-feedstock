#!/bin/bash

set -ex # Abort on error.

mkdir build
cd build

cmake -G "Unix Makefiles" \
      "${CMAKE_ARGS}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH="${PREFIX}" \
      -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      "${SRC_DIR}"

make

make install

ctest
