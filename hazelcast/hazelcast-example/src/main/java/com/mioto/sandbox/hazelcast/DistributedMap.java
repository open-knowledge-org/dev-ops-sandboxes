package com.mioto.sandbox.hazelcast;

import com.hazelcast.client.HazelcastClient;
import com.hazelcast.client.config.ClientConfig;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;

public class DistributedMap {

	public static void main(String[] args) {

		final ClientConfig clientConfig = new ClientConfig();
		clientConfig.getNetworkConfig().addAddress("127.0.0.1");

		final HazelcastInstance client = HazelcastClient.newHazelcastClient(clientConfig);
		System.out.println(clientConfig.toString());

		distributedMap(client);

		HazelcastClient.shutdownAll();
	}

	/*
	 * Once executed, access http://localhost:8080/dev/maps/my-distributed-map
	 */
	private static void distributedMap(final HazelcastInstance hz) {
		// Get the Distributed Map from Cluster.
		final IMap map = hz.getMap("my-distributed-map");
		//Standard Put and Get.
		map.put("key", "value");
		map.get("key");
		//Concurrent Map methods, optimistic updating
		map.putIfAbsent("somekey", "somevalue");
		map.replace("key", "value", "newvalue");
		// Shutdown the Hazelcast Cluster Member
		hz.shutdown();
	}
}
