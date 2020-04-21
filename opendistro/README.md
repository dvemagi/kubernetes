# Installare opendistro 

### Creare helm aggiornato

```
 > git clone https://github.com/opendistro-for-elasticsearch/opendistro-build
 > cd opendistro-build/helm/opendistro-es/
 > helm package .
 > helm install opendistro-es opendistro-es-1.6.0.tgz --generate-name 
```
Nonostante quello che indica il default le opzioni di base non sono corrette (non vengono effattuati i deploy di pod ridondanti)
per cui vanno aggiunte le seguenti opzioni

```
-- set elasticsearch.data.replicas=2
-- set elasticsearch.master.replicas=2
-- set elasticsearch.client.replicas=2
```

