#!/usr/bin/env bash

BUILD_DIR=./build
if [ -d ${BUILD_DIR} ]
then
	rm -rf ${BUILD_DIR}
fi
mkdir ${BUILD_DIR}

javac -sourcepath ./src -d ${BUILD_DIR} ./src/britzl/TestStuff.java

pushd ${BUILD_DIR}
jar cfe test.jar britzl.TestStuff britzl/*.class
mv test.jar ..
popd