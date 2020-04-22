#!/bin/bash

namespace="$1"
if  ["$namespace" = "" ]
    then 
        echo "Inserire in nome del namespace"
        exit
    fi

# Fa il deploy dei container e carica il nome della release nella variabile
helm_release="helm -n $1 install opendistro-es-1.6.0.tgz --generate-name -f opendistro-values.yaml | awk '/NAME:/ { print $2 }' -"

# sostituisco il valore nel template LB di elastic
template_elastic=`cat "opendistro-elastic-lb.yaml.template" | sed "s/{{helm_release}}/$helm_release/g"` 

# effettuo il deploy del LB di elastic
echo "$template_elastic" | kubectl -n "$namespace" apply -f -

# sostituisco il valore nel template LB di kibana
template_kibana=`cat "opendistro-kibana-lb.yaml.template" | sed "s/{{helm_release}}/$helm_release/g"` 

# effettuo il deploy del LB di elastic
echo "$template_kibana" | kubectl -n "$namespace" apply -f -


