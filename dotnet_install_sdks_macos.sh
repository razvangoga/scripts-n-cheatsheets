#!/usr/bin/env bash

./dotnet_install_sdks.sh --architecture arm64 --os macos

# dotnet configurations
dotnet dev-certs https --trust
dotnet --info
