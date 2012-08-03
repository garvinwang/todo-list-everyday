package com.todolisteveryday

class TodoList {

	String title

	List todos
	static hasMany = [todos:Todo]

	static mapping = { todos cascade: "all-delete-orphan" }

	static constraints = { title(nullable:false) }

	TodoList(title){
		this.title = title
	}
}
