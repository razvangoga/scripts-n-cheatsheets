wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh -v 6.0.428
./dotnet-install.sh -v 8.0.408
./dotnet-install.sh -v 9.0.203

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

dotnet dev-certs https --trust
dotnet --info

rm dotnet-install.sh

