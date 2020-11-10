FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore todoapi.csproj

# copy everything else and build app
COPY . ./
RUN dotnet publish todoapi.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "todoapi.dll"]
