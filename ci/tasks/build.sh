#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export M2_HOME=$MY_DIR/repo

mkdir -p ${M2_HOME}/conf
cp repo/settings.xml ${M2_HOME}/conf

cd repo
gradle --full-stacktrace --parallel --no-daemon assemble
mv build/libs/sample-spring-cloud-svc-ci.jar ../build/sample-spring-cloud-svc-ci.jar
