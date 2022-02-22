FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY TaskList/TaskList.csproj TaskList/
RUN dotnet restore TaskList/TaskList.csproj
COPY . .
WORKDIR /src/TaskList
RUN dotnet build TaskList.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish TaskList.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "TaskList.dll"]
