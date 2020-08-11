### Hazelcast IMDG 


#### IMDG Introduction

Hazelcast IMDG offers simple scalability, partitioning (sharding), and re-balancing out of the box. It does not require any extra coordination processes. By comparison, NoSQL and traditional databases are difficult to scale out and manage. They require additional processes for coordination and high availability. With Hazelcast, when you start another process to add more capacity, data and backups are automatically and evenly balanced.

The most popular use case for Hazelcast IMDG is distributed in-memory caching. Hazelcast IMDG has flexible structures such as Maps, Sets, Lists, MultiMaps, Ringbuffers, and HyperLogLogs. Hazelcast IMDG retains all data in memory, so applications can achieve speeds far greater than traditional stores. Hazelcast IMDG is highly adaptable. It can slot into existing architectures and provide a single interface to multiple disparate data stores.

Hazelcast IMDG can run in any cloud using its multiple discovery plugins. It functions seamlessly in Kubernetes.

#### IMDG Capabilities

Hazelcast IMDG enables you to use familiar Java collections and concurrency interfaces and makes them distributed and highly available. You can:

Store terabytes of data in Java Collections without changing interfaces. Run distributed callables and runnables that run on the exact process where its required data resides.
Connect Java clients to the Hazelcast cluster. Hazelcast nodes are JVM-based, which allows applications to embed clustering.
Access the cluster from any JVM-based language.
Integrate with the wider Java ecosystem using libraries such as Spring Boot, Spring Data & Hibernate.


#### Executing

1) Download and start the Hazelcast IMDG 
- Download: https://download.hazelcast.com/download.jsp?version=hazelcast-4.0.2&p=

2) Download and start the Hazelcast Management Center
- Download: https://download.hazelcast.com/management-center/hazelcast-management-center-4.2020.08.zip

3) Clone this repository

4) Execute the DistributedMap class

5) Once executed, access http://localhost:8080/dev/maps/my-distributed-map
