#FrontEnd
FROM node:alpine AS frontend-builder
WORKDIR /app/frontend
COPY taskfront .
RUN npm install -g @angular/cli
RUN npm install
RUN ng build --configuration=production

FROM nginx:alpine
COPY --from=frontend-builder /app/frontend/dist/taskfront /usr/share/nginx/html

