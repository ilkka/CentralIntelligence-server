FROM python:3 as spacy
RUN pip install wheel socketIO-client spacy
RUN python -m spacy download en

FROM node:6
COPY --from=spacy /usr/local /usr/local/
RUN ldconfig
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . ./
CMD ["npm", "start"]
EXPOSE 3000