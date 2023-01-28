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

SKIP=""

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  ctest -VV --output-on-failure -j${CPU_COUNT} ${SKIP}
fi
