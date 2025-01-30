# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the .csproj file and restore dependencies
COPY SimpleApi/*.csproj ./SimpleApi/
RUN dotnet restore ./SimpleApi/SimpleApi.csproj

# Copy the remaining application files into the container
COPY SimpleApi/ ./SimpleApi/

# Build the application and publish it to the /out directory
WORKDIR /app/SimpleApi
RUN dotnet publish -c Release -o /out

# Stage 2: Run the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Set the working directory for runtime
WORKDIR /app

# Copy the published files from the build stage
COPY --from=build /out .

# Expose the port the application listens on
EXPOSE 8080

# Define the entry point for the container
ENTRYPOINT ["dotnet", "SimpleApi.dll"]

