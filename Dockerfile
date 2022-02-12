FROM node:16

COPY node_modules/ /usr/src/node_modules/
COPY ./dist /usr/src/dist/
COPY ./www /usr/src/www/
COPY ./demo /usr/src/demo/
COPY ./package.json /usr/src/
COPY ./package-lock.json /usr/src/
EXPOSE 3000
CMD ["npm", "run", "demo"]
