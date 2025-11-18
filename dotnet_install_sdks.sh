#!/usr/bin/env bash

wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh
wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sig
gpg --verify dotnet-install.sig dotnet-install.sh

chmod +x dotnet-install.sh

./dotnet-install.sh -v 8.0.416 --architecture arm64 --os macos
./dotnet-install.sh -v 9.0.307 --architecture arm64 --os macos
./dotnet-install.sh -v 10.0.100 --architecture arm64 --os macos

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

rm dotnet-install.sh
rm dotnet-install.sig

dotnet --info