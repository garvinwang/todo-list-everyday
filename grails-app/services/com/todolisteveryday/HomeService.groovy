package com.todolisteveryday

class HomeService {

	TodoService todoService
	
    def getLastFinishedTodo() {
		todoService.getLastTodo(13, TodoStatus.FINISH)
    }
	
	def getLastProcessingTodo() {
		todoService.getLastTodo(6, TodoStatus.PROCESS)
	}
	
	def getLastReadyTodo() {
		todoService.getLastTodo(6, TodoStatus.READY)
	}
	
	def getLastDelayTodo() {
		todoService.getLastTodo(13, TodoStatus.DELAYED)
	}
}
