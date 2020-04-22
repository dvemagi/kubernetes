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


```
--set elasticsearch.data.replicas=2
--set elasticsearch.master.replicas=2
--set elasticsearch.client.replicas=2
--set elasticsearch.data.storage="50Gi"
```

