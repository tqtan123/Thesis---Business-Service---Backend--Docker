FROM nodered/node-red:latest
COPY flows.json /data/flows.json
RUN npm install \
    node-red-node-google \
    node-red-contrib-google-cloud \
    node-red-contrib-genai
EXPOSE 1880
