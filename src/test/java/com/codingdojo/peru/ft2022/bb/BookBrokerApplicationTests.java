package com.codingdojo.peru.ft2022.bb;

import com.codingdojo.peru.ft2022.bb.controllers.BookController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class BookBrokerApplicationTests {

	@Autowired
	private BookController controller;

	@Test
	void contextLoads() {
	}

	@Test
	void testController() {
		assertThat(controller).isNotNull();
	}
}
