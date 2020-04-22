#!/bin/bash

#namespace="$1"

# Fa il deploy dei container
#helm -n "$1" install opendistro-es-1.6.0.tgz --generate-name -f opendistro-values.yaml

# prendo il nome della release
helm_release="$1"

# sostituisco il valore nel template LB di elastic
template=`cat "opendistro-elastic-lb.yaml.template" | sed "s/{{helm_release}}/$helm_release/g"` 

# effettuo il deploy del LB di elastic
echo "$template" 
#| kubectl apply -f -

# sostituisco il valore nel template LB di kibana
template=`cat "opendistro-kibana-lb.yaml.template" | sed "s/{{helm_release}}/$helm_release/g"` 

# effettuo il deploy del LB di elastic
echo "$template" 
#| kubectl apply -f -

