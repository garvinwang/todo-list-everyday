package com.todolisteveryday

class Interruption {
	
	String description
	Date start
	Date end
	
	static belongsTo = [todo:Todo]
	
    static constraints = {
    }
}
