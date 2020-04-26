# Creare nginx-ingress

Creare la struttura base per AWS

questo comando crea un namespace nginx-ingress ed effattual il deploy di un ingress
viene costruiton un NLB che passa porta 80 e 443 usando il certificato della destinazione
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/aws/deploy.yaml

metodi altrenativi (usare ertificato di AWS)
https://kubernetes.github.io/ingress-nginx/deploy/#aws


ipotesi su medium
https://medium.com/@Joachim8675309/adding-ingress-with-amazon-eks-6c4379803b2

blog di AWS
https://aws.amazon.com/premiumsupport/knowledge-center/eks-access-kubernetes-services/

