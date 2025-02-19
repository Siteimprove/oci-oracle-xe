#!/bin/bash
# Since: September, 2021
# Author: gvenzl
# Name: build_Dockerfile_2130.sh
# Description: Build test scripts for Oracle DB XE 21.3.0
#
# Copyright 2021 Gerald Venzl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Exit on errors
# Great explanation on https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -Eeuo pipefail

CURRENT_DIR=${PWD}

cd ../

echo "TEST: Building 21.3.0 FULL image"
./buildContainerImage.sh -v 21.3.0 -f
echo "DONE: Building 21.3.0 FULL image"

echo "TEST: Building 21.3.0 FULL FASTSTART image"
./buildContainerImage.sh -v 21.3.0 -f -x
echo "DONE: Building 21.3.0 FULL FASTSTART image"

echo "TEST: Building 21.3.0 REGULAR image"
./buildContainerImage.sh -v 21.3.0
echo "DONE: Building 21.3.0 REGULAR image"

echo "TEST: Building 21.3.0 REGULAR FASTSTART image"
./buildContainerImage.sh -v 21.3.0 -x
echo "DONE: Building 21.3.0 REGULAR FASTSTART image"

echo "TEST: Building 21.3.0 SLIM image"
./buildContainerImage.sh -v 21.3.0 -s
echo "DONE: Building 21.3.0 SLIM image"

echo "TEST: Building 21.3.0 SLIM FASTSTART image"
./buildContainerImage.sh -v 21.3.0 -s -x
echo "DONE: Building 21.3.0 SLIM FASTSTART image"


cd "${CURRENT_DIR}"
