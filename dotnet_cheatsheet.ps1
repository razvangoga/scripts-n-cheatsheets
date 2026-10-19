$Env:ASPNETCORE_ENVIRONMENT = "{{Environment}}"; dotnet run

# inspecting nuget packages
dotnet list package --vulnerable --include-transitive
dotnet nuget why <packagename>
