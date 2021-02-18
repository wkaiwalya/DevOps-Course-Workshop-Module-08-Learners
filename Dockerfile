FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS base 

RUN apt-get update \  
&& apt-get install curl gnupg -yq \  
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \ 
&& apt-get install nodejs -yq 

COPY . . 

RUN dotnet build 
WORKDIR /DotnetTemplate.Web
RUN npm install
RUN npm run build

EXPOSE 5000
CMD dotnet run
