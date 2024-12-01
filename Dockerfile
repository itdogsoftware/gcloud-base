FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:489.0.0-stable

LABEL authors = "Roy To <roy.to@itdogsoftware.co>"

# Install library & necessary service
RUN apt-get update -y && apt-get install curl gpg openssh-client docker.io -y && rm -rf /var/lib/apt/lists/*
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get update -y && apt-get install kubectl google-cloud-sdk-gke-gcloud-auth-plugin -y
