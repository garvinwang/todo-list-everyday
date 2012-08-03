package com.todolisteveryday

class TodoController {

	TodoService todoService
	TodoListService todoListService

	def create() {
		if(params.description && params.todoListId){
			def todo = todoService.create(params.description, todoListService.getWithId(params.todoListId))
			render(contentType: "text/json") { todo }
		}else{
			render(contentType: "text/json") { "" }
		}
	}

	def delete(){
		if(params.id){
			todoService.deleteWithId(params.id)
			render("1")
		}else{
			render("0")
		}
	}

	def update(){
		if(params.id && params.description){
			todoService.updateWithIdAndDescription(params.id, params.description)
			render("1")
		}else{
			render("0")
		}
	}
	def updateRemark(){
		if(params.id && params.remark){
			todoService.updateWithIdAndRemark(params.id, params.remark)
			render("1")
		}else{
			render("0")
		}
	}

	def detail(){
		if(params.id){
			def todo = todoService.getWithId(params.id)
			def partners =  todoListService.getWithId(todo.todoList.id).todos
			todoService.updateConsumption(todo)
			
			[todo: todo, partners: partners]
		}
	}

	def start(){
		if(params.id){
			Todo todo = todoService.getWithId(params.id)
			todo.todoStatus = TodoStatus.PROCESS
			todo.executionStart = new Date()
			todo.save(flush:true)
			render("1")
		}else{
			render("0")
		}
	}
	def interrupt(){
		if(params.id){
			def todo = todoService.getWithId(params.id)
			todo.todoStatus = TodoStatus.INTERRUPTED
			todo.save(flush:true)
			render("1")
		}else{
			render("0")
		}
	}
	def delay(){
		if(params.id){
			def todo = todoService.getWithId(params.id)
			todo.todoStatus = TodoStatus.DELAYED
			todo.save(flush:true)
			render("1")
		}else{
			render("0")
		}
	}
	def finish(){
		if(params.id){
			def todo = todoService.getWithId(params.id)
			todo.todoStatus = TodoStatus.FINISH
			todo.executionEnd = new Date()
			todo.save(flush:true)
			render("1")
		}else{
			render("0")
		}
	}
	def cancel(){
		if(params.id){
			def todo = todoService.getWithId(params.id)
			todo.todoStatus = TodoStatus.CANCEL
			todo.save(flush:true)
			render("1")
		}else{
			render("0")
		}
	}
}
