package com.todolisteveryday

class TodoExecutionLog {
	
	Date start
	Date end
	String description
	TodoStatus todoStatus
	
	static belongsTo = [todo:Todo]
	static mapping = {
		description(type:'text')
	}

    static constraints = {
		end(nullable:true)
		description(nullable:true)
		todoStatus(nullable:true)
    }
}
