package de.javaansehz.actuator;

import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicLong;

@Component
@Endpoint(id = "alive")
public class AliveActuatorEndpoint {

	private final AtomicLong counter = new AtomicLong();

	@ReadOperation
	public ResponseEntity<String> alive() {
		if(counter.incrementAndGet() > 5) {
			return new ResponseEntity<>("alive", HttpStatus.OK);
		}
		return new ResponseEntity<>("not alive",HttpStatus.SERVICE_UNAVAILABLE);
	}
}
