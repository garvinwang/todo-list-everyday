package com.todolisteveryday

import java.util.List;

/**
 * Todo
 * A domain class describes the data object and it's mapping to the database
 */
class Todo {

	String description
	String remark
	int consumption = 0
	//	Date planStart
	//	Date planEnd
	Date executionStart
	Date executionEnd
	TodoStatus todoStatus = TodoStatus.READY
	int interruption = 0
	//	List todoExecutionLogs

	static belongsTo = [todoList:TodoList]
	static hasMany = [todoExecutionLogs:TodoExecutionLog]

	static mapping = {
		remark(type:'text')
		todoExecutionLogs cascade: "all-delete-orphan"
		todoExecutionLogs sort:'start'
	}

	static constraints = {
		description(nullable:false)
		executionStart(nullable:true)
		executionEnd(nullable:true)
		remark(nullable:true)
	}

	Todo(description){
		this.description = description
	}
}
