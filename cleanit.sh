#!/bin/bash

[ -f Makefile ] && make clean
rm -f `find . -name cmake_install.cmake`
rm -rf `find . -name CMakeFiles`
rm -f `find . -name Makefile`
rm -f `find . -name '*_wrap.cxx'`
rm -rf build-python CMakeCache.txt

