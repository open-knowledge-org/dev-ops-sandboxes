package br.com.mioto.sandbox.rabbitmq;

import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import br.com.mioto.sandbox.rabbitmq.vo.QueueVO;

@RestController
public class OrderQueueSender {

	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(OrderQueueSender.class);

	@Autowired
	private RabbitTemplate rabbitTemplate;

	@Autowired
	private Queue queue;

	@RequestMapping(value = "/queue", method = RequestMethod.POST)
	@ResponseBody
	public QueueVO home(@RequestBody QueueVO queue) {
		send(queue);
		return queue;
	}

	public void send(QueueVO queue) {
		LOG.info("Sending: {}", queue);
		rabbitTemplate.convertAndSend(this.queue.getName(), new Gson().toJson(queue));
	}
}