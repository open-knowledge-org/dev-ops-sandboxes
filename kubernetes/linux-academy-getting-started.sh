### Linuxacademy - Kubernetes Essentials

# [Installing Kubeadm, Kubelet, and Kubectl]
# Now that Docker is installed, we are ready to install the Kubernetes components.
# In this lesson, I will guide you through the process of installing Kubeadm, Kubelet, and Kubectl on all three playground servers.
# After completing this lesson, you should be ready for the next step, which is to bootstrap the cluster.
# Here are the commands used to install the Kubernetes components in this lesson. Run these on all three servers.
# NOTE: There are some issues being reported when installing version 1.12.2-00 from the Kubernetes ubuntu repositories. You can work around this # by using version 1.12.7-00 for kubelet, kubeadm, and kubectl.

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet=1.12.7-00 kubeadm=1.12.7-00 kubectl=1.12.7-00
sudo apt-mark hold kubelet kubeadm kubectl
kubeadm version

#########################

# [Bootstrapping the Cluster]
# On the Kube master node, initialize the cluster: (That command may take a few minutes to complete.)

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# When it is done, set up the local kubeconfig:
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Verify that the cluster is responsive and that Kubectl is working: (You should get Server Version as well as Client Version)
kubectl version

# The kubeadm init command should output a kubeadm join command containing a token and hash. Copy that command and run it with sudo on both
# worker nodes. It should look something like this:
sudo kubeadm join $some_ip:6443 --token $some_token --discovery-token-ca-cert-hash $some_hash

# Running the command below, you should see all three of your nodes listed
kubectl get nodes

#########################
# [Configuring Networking with Flannel]
# Once the Kubernetes cluster is set up, we still need to configure cluster networking in order to make the cluster fully functional.
# In this lesson, we will walk through the process of configuring a cluster network using Flannel.
# You can find more information on Flannel at the official site: https://coreos.com/flannel/docs/latest/.
# On all three nodes, run the following:

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Install Flannel in the cluster by running this only on the Master node:
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

# Verify that all the nodes now have a STATUS of Ready:
# You should see all three of your servers listed, and all should have a STATUS of Ready. It should look something like this:
kubectl get nodes

# Note: It may take a few moments for all nodes to enter the Ready status, so if they are not all Ready, wait a few moments and try again.
# It is also a good idea to verify that the Flannel pods are up and running. Run this command to get a list of system pods:
kubectl get pods -n kube-system

# You should have three pods with flannel in the name, and all three should have a status of Running.

#########################
# [Containers and Pods]
# In order to run and manage containers with Kubernetes, you will need to use pods.
# In this lesson, we discuss the basics of what pods are and how they are related to containers within the world of Kubernetes.
# We will create a simple pod and then we will look at some ways to explore and interact with pods in your Kubernetes cluster.
# Create a simple pod running an nginx container:

cat << EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
EOF

# Get a list of pods and verify that your new nginx pod is in the Running state:
kubectl get pods

# Get more information about your nginx pod:
kubectl describe pod nginx

# Delete the pod:
kubectl delete pod nginx

#########################

# [Clustering and Nodes]
# Nodes are an essential part of the Kubernetes cluster. They are the machines where your cluster's container workloads are executed. In this
# lesson, we will discuss what nodes are in Kubernetes, and we will explore some ways in which you can find information about nodes in your
# cluster.

# Get a list of nodes:
kubectl get nodes

# Get more information about a specific node:
kubectl describe node $node_name

#########################

# [Networking in Kubernetes]

# Networking is an important part of understanding the basics of Kubernetes. This lesson provides a high-level overview of what a Kubernetes
# virtual cluster network looks like. We will also demonstrate how the network functions by contacting one pod from another pod over the virtual # network.

# Create a deployment with two nginx pods:
cat << EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.15.4
        ports:
        - containerPort: 80
EOF


# Create a busybox pod to use for testing:
cat << EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  containers:
  - name: busybox
    image: radial/busyboxplus:curl
    args:
    - sleep
    - "1000"
EOF

# Get the IP addresses of your pods:
kubectl get pods -o wide

# Get the IP address of one of the nginx pods, then contact that nginx pod from the busybox pod using the nginx pod's IP address:
kubectl exec busybox -- curl $nginx_pod_ip

# A Kubernetes cluster is made up of multiple individual components running on the various machines that are part of the cluster. In this lesson, we will briefly discuss the major Kubernetes software components and what each of them do. We will also look into how these components are actually running in our cluster currently.

# Get a list of system pods running in the cluster:
kubectl get pods -n kube-system

# Check the status of the kubelet service:
sudo systemctl status kubelet

#########################

# [Kubernetes Deployments]

# Deployments are an important tool if you want to take full advantage of the automation capabilities provided by Kubernetes.
# In this lesson, we will discuss what deployments are and briefly mention some common use cases for Kubernetes deployments.
# We will also create a simple deployment in our cluster and explore how we can interact with it.

# Create a deployment:
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.15.4
        ports:
        - containerPort: 80
EOF

# Get a list of deployments:
kubectl get deployments

# Get more information about a deployment:
kubectl describe deployment nginx-deployment

# Get a list of pods:
kubectl get pods

# You should see two pods created by the deployment.

#########################

# While deployments provide a great way to automate the management of your pods, you need a way to easily communicate with the dynamic set of replicas managed by a deployment. This is where services come in. In this lesson, we will discuss what services are in Kubernetes, demonstrate how to create a simple service, and explore that service in our own cluster.

# Create a NodePort service on top of your nginx pods:
cat << EOF | kubectl create -f -
kind: Service
apiVersion: v1
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30080
  type: NodePort
EOF

# Get a list of services in the cluster.
kubectl get svc

# You should see your service called nginx-service.
# Since this is a NodePort service, you should be able to access it using port 30080 on any of your cluster's servers. You can test this with the # command:
curl localhost:30080

# You should get an HTML response from nginx!

#########################

# [Deploying the Robot Shop App]
# Kubernetes is a powerful tool for managing and deploying microservice applications.
# In this lesson, we will deploy a microservice application consisting of multiple varied components to our cluster.
# We will also explore the application briefly in order to get a hands-on glimpse of what a microservice application might look like, and how it # might run in a Kubernetes cluster.
# Here are the commands used in the demonstration to deploy the Stan's Robot Shop application:

# Clone the Git repository:
cd ~/
git clone https://github.com/linuxacademy/robot-shop.git

# Create a namespace and deploy the application objects to the namespace using the deployment descriptors from the Git repository:
kubectl create namespace robot-shop
kubectl -n robot-shop create -f ~/robot-shop/K8s/descriptors/

# Get a list of the application's pods and wait for all of them to finish starting up:
kubectl get pods -n robot-shop -w

# Once all the pods are up, you can access the application in a browser using the public IP of one of your Kubernetes servers and port 30080:
# http://$kube_server_public_ip:30080