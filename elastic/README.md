# per installare su eks

Creare un namespace
kubect create namespace '<nome_del_namespace>'

### Deploy tramite Helm dei container

Deploy di elasticsearch 
> helm -n <namespace> install <nome del deploy> bitnami/elasticsearch 

opzioni 
    --set data.persistence.size=50Gi 
crea un disco da 50 GB per i nodi data
tutte le opzioni https://github.com/bitnami/charts/tree/master/bitnami/elasticsearch

deploy di kibana tramite helm
> helm -n '<namespace>' install <nome del deploy> bitnami/elasticsearch 

obbligatori     
    --set elasticsearch.hosts[0]=<hostname istanza> nome interno che viene data alla creazione di helm elasticsearch  
    --set elasticsearch.port=<porta di solito 9200 

### Creazione dei loadbalancer

Load balancer per elasticsearch
kubectl -n '<namespace>' apply -f elastic-loadbalancer.yaml
attenzione a cambiare nel selector il parametro **release** che è uguale al nome dato dalla release di helm

kubectl -n '<namespace>' apply -f kibana-loadbalancer.yaml
attenzione a cambiare nel selector il parametro **app.kubernetes.io/instance** che è uguale al nome dato dalla release di helm
