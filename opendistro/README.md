# Installare opendistro 

### Creare helm aggiornato

```
 > git clone https://github.com/opendistro-for-elasticsearch/opendistro-build
 > cd opendistro-build/helm/opendistro-es/
 > helm package .
```
 
 Installazione di default con nome generato automaticamente
 > helm install opendistro-es opendistro-es-1.6.0.tgz --generate-name 
 
  Installazione di default con nome scelto
 > helm install [nome-release] opendistro-es opendistro-es-1.6.0.tgz 
 

Il deploy lo si può eseguire passando un file **yaml** con i parametri
 > helm install opendistro-es-XXX-tgz -f [file-values.yaml] 
 
Per il deploy in un namespace specifico
 > helm install opendistro-es-XXX-tgz -f [file-values.yaml] -n [namespace]



## Caratteristiche del file opendistro-values.yaml

deploy dei seguenti container
2 x Client Node
1 x Master Node
2 x Data Node
1 x Kibana

Dischi persistenti 
10 GB per Master
50 GB per Data 

# Deploy automatico con load balancer per AWS

Il file **opendistro-deploy.sh** effettua il deploy automatico usando opendistro-values.yaml con un nome generato e poi inizializza e collega due load balancer

parametri
-ssl arn del dertificato
-n namespace

> [nome-release]-kibana-lb sulla porta 5601 in ssl con il certificato passato
> [nome-release]-elastic-lb sulla porta 9200 in ssl con il certificato passato


