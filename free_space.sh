#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -eux

df -h
echo "::group::/usr/share/dotnet"
du -hsc /usr/share/dotnet
echo "::endgroup::"

sudo rm -rf /usr/share/dotnet || :
echo "::group::/usr/local/*"
du -hsc /usr/local/*
echo "::endgroup::"

sudo rm -rf \
  /usr/local/aws-sam-cil \
  /usr/local/julia* || :
echo "::group::/usr/local/bin/*"
du -hsc /usr/local/bin/*
echo "::endgroup::"

sudo rm -rf \
  /usr/local/bin/aliyun \
  /usr/local/bin/azcopy \
  /usr/local/bin/bicep \
  /usr/local/bin/cmake-gui \
  /usr/local/bin/cpack \
  /usr/local/bin/helm \
  /usr/local/bin/hub \
  /usr/local/bin/kubectl \
  /usr/local/bin/minikube \
  /usr/local/bin/node \
  /usr/local/bin/packer \
  /usr/local/bin/pulumi* \
  /usr/local/bin/sam \
  /usr/local/bin/stack \
  /usr/local/bin/terraform || :

sudo rm -rf /usr/local/bin/oc || : \
echo "::group::/usr/local/share/*"
du -hsc /usr/local/share/*
echo "::endgroup::"

sudo rm -rf /usr/local/share/chromium || :

sudo rm -rf /usr/local/share/powershell || :
echo "::group::/usr/local/lib/*"
du -hsc /usr/local/lib/*
echo "::endgroup::"

sudo rm -rf /usr/local/lib/android || :

sudo rm -rf /usr/local/lib/heroku || :

sudo rm -rf /usr/local/lib/node_modules || :
echo "::group::/opt/*"
du -hsc /opt/*
echo "::endgroup::"

sudo rm -rf /opt/az || :
sudo rm -rf /opt/ghc || :
echo "::group::/opt/microsoft/*"
du -hsc /opt/microsoft/*
echo "::endgroup::"

sudo rm -rf /opt/microsoft/powershell || :
echo "::group::/opt/hostedtoolcache/*"
du -hsc /opt/hostedtoolcache/*
echo "::endgroup::"

sudo rm -rf /opt/hostedtoolcache/CodeQL || :

sudo rm -rf /opt/hostedtoolcache/go || :

sudo rm -rf /opt/hostedtoolcache/PyPy || :

sudo rm -rf /opt/hostedtoolcache/node || :

sudo apt purge -y \
  firefox \
  google-chrome-stable \
  microsoft-edge-stable

sudo docker image prune --all --force
sudo docker builder prune -a

df -h