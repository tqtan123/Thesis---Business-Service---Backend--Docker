FROM nodered/node-red:latest

COPY flows.json /data/flows.json

RUN npm install \
    node-red-node-google \
    node-red-contrib-google-cloud \
    node-red-contrib-genai

# bắt Node-RED chạy port 8080
ENV PORT=8080
ENV NODE_RED_PORT=8080

EXPOSE 8080

CMD ["npm", "start", "--", "--port", "8080"]
