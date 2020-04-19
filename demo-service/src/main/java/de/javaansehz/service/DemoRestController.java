package de.javaansehz.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/api")
public class DemoRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(DemoRestController.class);

    @GetMapping(value = "/test/{number}")
    public ResponseEntity<String> test(@PathVariable Integer number) throws UnknownHostException, JsonProcessingException {
        for (var i = 0; i < number; i++)
            Math.tan(Math.atan(Math.tan(Math.atan(i))));
        LOGGER.info(InetAddress.getLocalHost().getHostAddress());
        return new ResponseEntity<>(InetAddress.getLocalHost().getHostAddress(), HttpStatus.OK);
    }
}
