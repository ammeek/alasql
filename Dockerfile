FROM node:25.0.0-slim
RUN apt-get update && apt-get install -y git && apt-get clean

COPY . /alasql

WORKDIR /alasql

RUN yarn install

# not useing install-g as I am haveing issues with prettier.
RUN yarn run build-only
RUN npm uninstall alasql -g && npm install -g .

ENTRYPOINT ["alasql"]
