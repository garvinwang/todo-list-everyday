package com.todolisteveryday

class TodoListController {

	TodoListService todoListService
	TodoService todoService

	def index() {
		def historyList = getHistoryList()

		["historyList": historyList, lastTodo: todoService.getLastTodo(10,TodoStatus.FINISH)]
	}

	def create(){
		def todoList = todoListService.create()
		render(	view: "edit", model: [todoList: todoList, historyTodlList: getHistoryList()])
	}

	def edit(){
		if(params.id){
			[todoList: todoListService.getWithId(params.id), historyTodlList: getHistoryList()]
		}
	}
	
	private def getHistoryList(){
		todoListService.historyList(15)
	}
}
