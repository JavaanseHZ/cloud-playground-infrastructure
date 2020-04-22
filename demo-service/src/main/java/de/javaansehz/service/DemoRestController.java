package de.javaansehz.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
@RequestMapping("/api")
public class DemoRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(DemoRestController.class);

    @GetMapping(value = "/ipaddress")
    public ResponseEntity<String> ipaddress() throws UnknownHostException {
        //Math.tan(Math.atan(Math.tan(Math.atan(2345))));
        LOGGER.info(InetAddress.getLocalHost().getHostAddress());
        return new ResponseEntity<>(InetAddress.getLocalHost().getHostAddress(), HttpStatus.OK);
    }

}
