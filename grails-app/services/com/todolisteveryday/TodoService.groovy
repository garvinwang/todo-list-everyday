package com.todolisteveryday

class TodoService {

	TodoExecutionLogService todoExecutionLogService
	
	def create(description,todoList) {
		Todo todo = new Todo(description)
		todoList.addToTodos(todo).save(flush:true,failOnError:true)
		return todo
	}

	def getWithId(id){
		Todo.get(id)
	}

	def deleteWithId(id){
		def todo = getWithId(id)
		if(todo){
			//			todo.delete(flush:true)
			def todoList = todo.todoList
			todoList.removeFromTodos(todo).save(flush:true)
		}
	}

	def updateWithIdAndDescription(id,description){
		def todo = getWithId(id)
		if(todo){
			todo.description = description
			todo.save(flush:true)
		}
	}

	def updateWithIdAndRemark(id,remark){
		def todo = getWithId(id)
		if(todo){
			todo.remark = remark
			todo.save(flush:true)
		}
	}

	def getLastTodo(max,todoStatus){
		def c = Todo.createCriteria()
		def results = c.list{
			eq("todoStatus", todoStatus)
			maxResults(max)
			order("id", "desc")
		}
	}

	def updateConsumption(todo){
		def consume = 0
		todo.todoExecutionLogs?.each {
			consume += todoExecutionLogService.getTimeDifference(it)
		}
		todo.consumption = consume
		todo.save(flush:true)
		
	}
}
