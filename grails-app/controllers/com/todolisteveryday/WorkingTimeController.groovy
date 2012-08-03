package com.todolisteveryday

class WorkingTimeController {

	WorkingTimeService workingTimeService

	def index() {
		[workingTime:workingTimeService.getWoringTime()]
	}
}
