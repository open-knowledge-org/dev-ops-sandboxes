package br.com.mioto.sandbox.rabbitmq.vo;

public class QueueVO {

	private String body;

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "QueueVO [body=" + body + "]";
	}

}
