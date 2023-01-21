
setlocal EnableDelayedExpansion

mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

if  %vc% LEQ 9 set MSVC_VER=1500
if  %vc% GTR 9 set MSVC_VER=1900

if  %vc% LEQ 9 set MSVC_TS_VER=90
if  %vc% GTR 9 set MSVC_TS_VER=140

cmake -GNinja ^
      "%CMAKE_ARGS%" ^
      -DMSVC_VERSION="%MSVC_VER%" ^
      -DMSVC_TOOLSET_VERSION="%MSVC_TS_VER%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_LIBRARY_PATH:PATH="%LIBRARY_PREFIX%;%LIBRARY_PREFIX%/bin" ^
      -DBUILD_SHARED_LIBS:BOOL=OFF ^
      "%SRC_DIR%"
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
