# Katacoda  -  run a virtual terminal in your web browser that runs Minikube
# The master coordinates all activities in your cluster, such as scheduling applications, maintaining applications' desired state, scaling applications, and rolling out new updates.
# Each node has a Kubelet, which is an agent for managing the node and communicating with the Kubernetes master
# A Kubernetes cluster that handles production traffic should have a minimum of three nodes.
# The nodes communicate with the master using the Kubernetes API,

# To get started with Kubernetes development, you can use Minikube.
# Minikube is a lightweight Kubernetes implementation that creates a VM on your local machine and deploys a simple cluster containing only one node.

minikube version
minikube start
kubectl version
kubectl cluster-info
kubectl get nodes

# Once the application instances are created, a Kubernetes Deployment Controller continuously monitors those instances.
# You can create and manage a Deployment by using the Kubernetes command line interface, Kubectl. Kubectl uses the Kubernetes API to interact with the cluster.
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080

# searched for a suitable node where an instance of the application could be run (we have only 1 available node)
# scheduled the application to run on that Node configured the cluster to reschedule the instance on a new Node when needed
kubectl get deployments

# The kubectl command can create a proxy that will forward communications into the cluster-wide, private network. The proxy can be terminated by pressing control-C and won't show any output while its running.
kubectl proxy
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/

# https://kubernetes.io/docs/tutorials/kubernetes-basics/explore/explore-intro/
#################

kubectl get - list resources
kubectl describe - show detailed information about a resource
kubectl logs - print the logs from a container in a pod
kubectl exec - execute a command on a container in a pod

#################

# Let’s verify that the application we deployed in the previous scenario is running. We’ll use the kubectl get command and look for existing Pods:
kubectl get pods
# Next, to view what containers are inside that Pod and what images are used to build those containers we run the describe pods command:
kubectl describe pods

# Anything that the application would normally send to STDOUT becomes logs for the container within the Pod. We can retrieve these logs using the kubectl logs command:


export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
kubectl logs $POD_NAME
# We can execute commands directly on the container once the Pod is up and running. For this, we use the exec command and use the name of the Pod as a parameter. Let’s list the environment variables:

kubectl exec $POD_NAME env

# Next let’s start a bash session in the Pod’s container:
kubectl exec -ti $POD_NAME bash

# We have now an open console on the container where we run our NodeJS application. The source code of the app is in the server.js file:
cat server.js

# You can check that the application is up by running a curl command:
curl localhost:8080
