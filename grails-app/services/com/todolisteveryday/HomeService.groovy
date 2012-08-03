package com.todolisteveryday

class HomeService {

	TodoService todoService
	
    def getLastFinishedTodo() {
		todoService.getLastTodo(10, TodoStatus.FINISH)
    }
	
	def getLastProcessingTodo() {
		todoService.getLastTodo(10, TodoStatus.PROCESS)
	}
	
	def getLastReadyTodo() {
		todoService.getLastTodo(10, TodoStatus.READY)
	}
}
