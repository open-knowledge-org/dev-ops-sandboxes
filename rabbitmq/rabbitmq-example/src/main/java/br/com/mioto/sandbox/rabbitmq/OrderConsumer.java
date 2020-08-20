package br.com.mioto.sandbox.rabbitmq;

import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import br.com.mioto.sandbox.rabbitmq.vo.QueueVO;

@Component
public class OrderConsumer {

	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(OrderConsumer.class);

	@RabbitListener(queues = {"${queue.order.name}"})
	public void receive(@Payload String body) {
		final QueueVO queue = new Gson().fromJson(body, QueueVO.class);
		LOG.info("Body: {}", queue);
	}
}