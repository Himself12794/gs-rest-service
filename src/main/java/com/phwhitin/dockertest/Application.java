package com.phwhitin.dockertest;

public class Application {

	public static void main(String[] args) {
		System.out.println("Hello world, from inside Docker!");
		System.out.println(ProcessHandle.current().pid());
	}

}
