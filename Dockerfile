FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:489.0.0-stable

LABEL authors = "Roy To <roy.to@itdogsoftware.co>"

# Install library & necessary service
RUN apt-get update -y && apt-get install curl gpg openssh-client docker.io jq -y && rm -rf /var/lib/apt/lists/*
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get update -y && apt-get install kubectl google-cloud-sdk-gke-gcloud-auth-plugin -y
RUN ssh-keygen -t rsa -f /root/.ssh/google_compute_engine -C "" -N ""
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 ./get_helm.sh && ./get_helm.sh && rm ./get_helm.sh
