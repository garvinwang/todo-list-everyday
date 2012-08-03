package com.todolisteveryday

class TodoExecutionLogService {

	def create(start,end,description,todo) {
		TodoExecutionLog todoExecutionLog = new TodoExecutionLog()

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-M-dd hh:mm")

		todoExecutionLog.start = (Date)formatter.parse(start)
		if(end){
			todoExecutionLog.end = (Date)formatter.parse(end)
		}

		todoExecutionLog.description = description

		todo.addToTodoExecutionLogs(todoExecutionLog).save(flush:true,failOnError:true)

		return todoExecutionLog
	}

	def deleteWithId(id){
		def todoExecutionLog = getWithId(id)
		if(todoExecutionLog){
			def todo = todoExecutionLog.todo
			todo.removeFromTodoExecutionLogs(todoExecutionLog).save(flush:true)
		}
	}

	def getWithId(id){
		if(id){
			TodoExecutionLog.get(id)
		}
	}

	def update(todoExecutionLog,start,end,description){
		if(todoExecutionLog){
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-M-dd hh:mm")
			todoExecutionLog.start = (Date)formatter.parse(start)
			if(end){
				todoExecutionLog.end = (Date)formatter.parse(end)
			}
			todoExecutionLog.description = description
			todoExecutionLog.save(flush:true)
		}
	}
	
	def getTimeDifference(todoExecutionLog){
		def start = todoExecutionLog.start
		def end = todoExecutionLog.end
		if(start && end){
			def days = end.day - start.day
			def hours = end.hours - start.hours
			def minutes = end.minutes - start.minutes
//			println "---- $days ---- $hours ---- $minutes"
			return days * 24 * 60 + hours * 60 + minutes
		}else{
			return 0
		}
	}
}
