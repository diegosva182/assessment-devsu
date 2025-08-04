FROM node:18.15.0-alpine

RUN addgroup app && adduser -S -G app appuser

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN chown -R appuser:app /app

USER appuser

ENV PORT=8000

EXPOSE $PORT

HEALTHCHECK --interval=30s --timeout=3s CMD wget --spider http://localhost:8000/api/users || exit 1

CMD ["npm", "start"]
