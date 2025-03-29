package com.macro.mall.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.macro.mall.demo.mapper")
public class MallDemoApplication{
	public static void main(String[] args) {
		SpringApplication.run(MallDemoApplication.class, args);
	}
}
