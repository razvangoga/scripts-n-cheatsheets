#!/usr/bin/env bash

wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh -v 6.0.428
./dotnet-install.sh -v 8.0.411
./dotnet-install.sh -v 9.0.301

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

rm dotnet-install.sh

dotnet --info