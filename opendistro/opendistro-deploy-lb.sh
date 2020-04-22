#!/bin/bash

# Fa il deploy dei container
#helm -n od-ics-test install opendistro-es-1.6.0.tgz --generate-name --set elasticsearch.data.replicas=2 --set elasticsearch.client.replicas=2 --set elasticsearch.data.storage="50Gi"

# prendo il valore 
helm_release = "$1"

# sostituisco il valore nel template LB di elastic
template=`cat "opendistro-elastic-lb.yaml.template" | sed "s/{{helm_release}}/$helm_release/g"` 

# effettuo il deploy del LB di elastic
echo "$template" 
#| kubectl apply -f -

