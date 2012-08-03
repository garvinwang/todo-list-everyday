package com.todolisteveryday

class TodoExecutionLogController {

	TodoExecutionLogService todoExecutionLogService
	TodoService todoService

	def create() {
		def todoId = params.todo_id
		def start = params.start
		def end = params.end
		def description = params.description

		if(todoId && start){
			def todo = todoService.getWithId(todoId)
			def todoExecutionLog = todoExecutionLogService.create(start,end,description,todo)
			render(contentType: "text/json") { todoExecutionLog }
		}else{
			render(contentType: "text/json") { "" }
		}
	}

	def delete(){
		if(params.id){
			todoExecutionLogService.deleteWithId(params.id)
			render("1")
		}else{
			render("0")
		}
	}

	def update(){
		def id = params.id
		def start = params.start
		def end = params.end
		def description = params.description

		if(id && start){
			def todoExecutionLog = todoExecutionLogService.getWithId(id)
			todoExecutionLogService.update(todoExecutionLog, start, end, description)
			render("1")
		}else{
			render("0")
		}
	}
}
