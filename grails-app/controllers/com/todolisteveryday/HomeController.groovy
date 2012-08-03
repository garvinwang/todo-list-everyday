package com.todolisteveryday

class HomeController {

	HomeService homeService

	def index() {
		//get last finished todo
		def finishTodos = homeService.getLastFinishedTodo()
		//get last ready todo
		def redayTodos = homeService.getLastReadyTodo()
		//get last processing todo
		def processTodos = homeService.getLastProcessingTodo()

		[finishTodos:finishTodos,redayTodos:redayTodos,processTodos:processTodos]
	}
}
