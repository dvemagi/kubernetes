
# Deploy wordpress

helm install -n [namespace] bitnami/wordpress --generate-name
la procedura nella prima riga restituisce il nome del deploy

al termine della procedura lanciare il comando 
"kubectl get secret --namespace [namespace] [nome-deploy] -o jsonpath="{.data.wordpress-password}" | base64 --decode"

che restituisce la password di di amministrazione (utente user)

lanciare il comando

kubectl -n [namespace] get all

annotarsi il numero del loadbalancer


### Creazione o modifica del loadbalancer
#### Modifica 

Aprire da console il loadbalancer
editare i listener
mettere il listener per ssl con **load balanceer protocol** HTTPS su 443 instance protocol HTTP sulla porta del HTTP e poi scegliere il certificato

#### Creazione

modificare il file modificando il parametro

**app.kubernetes.io/instance:** con il nome del deploy
**service.beta.kubernetes.io/aws-load-balancer-ssl-cert:** inserendo ARN del certificato

"kubectl -n [namespace] apply -f wordpress-loadbalancer.yaml"




