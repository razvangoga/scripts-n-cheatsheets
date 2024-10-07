
for sdk in dotnet-sdk6 dotnet-sdk8-0-300 dotnet-sdk8
do
    echo "==> reinstalling $sdk"
    brew uninstall --zap --cask $sdk
    brew install --cask $sdk
    echo "==> done reinstalling $sdk"
done

dotnet workload update

dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

dotnet --info

