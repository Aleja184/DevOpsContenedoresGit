# DevOpsContenedoresGit}+
La carpeta manifests tiene los manifiestos que se encargan de crear los service y deployments para el servicio de front-end y back-end. 
Tiene los archivos dockerfile para crear las imágenes de cada servicio. 
El azure-pipeline se encarga de la ejecución de un pipeline en Azure DevOps, el pipeline conteneriza los servicios de la aplicación, los pública en DockerHub y por último los pública en ECR.
