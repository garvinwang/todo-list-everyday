package com.todolisteveryday

class TodoListService {

	def create() {
		String todayTitle = getTodayTitle()
		def todayTodoList = getWithTitle(todayTitle)
		if(!todayTodoList){
			todayTodoList = new TodoList(todayTitle)
			if (!todayTodoList.save(flush:true)) {
				todayTodoList.errors.each { println it }
			}
		}
		return todayTodoList
	}
	
	def getTodayTodoList(){
		return create()
	}

	def deleteWithId(id){
		def todoList = getWithId(id)
		if(todoList){
			todoList.delete(flush: true)
		}
	}

	def getWithId(id){
		TodoList.get(id)
	}

	def getWithTitle(title){
		TodoList.findByTitle(title)
	}

	def historyList(max){
		max = max?max:10
		TodoList.listOrderById(max:max, order:"desc")
	}
	
	private def getTodayTitle(){
		new Date().format("yyyy-MM-dd")
	}
}
