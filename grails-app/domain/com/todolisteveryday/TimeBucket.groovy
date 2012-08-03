package com.todolisteveryday

class TimeBucket {
	
	Date start
	Date end
	
	static belongsTo = [workingTime: WorkingTime]
	
    static constraints = {
		start(nullable:false)
		end(nullable:false)
    }
}
