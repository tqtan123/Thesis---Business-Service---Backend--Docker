FROM nodered/node-red:latest

COPY flows.json /data/flows.json

RUN npm install \
    node-red-node-google \
    node-red-contrib-google-cloud \
    node-red-contrib-genai

# ép Node-RED chạy đúng port Cloud Run
ENV PORT=8080

EXPOSE 8080

CMD ["node-red", "-p", "8080"]
