package com.todolisteveryday

class WorkingTime {

	int totalMinites = 0

	static hasMany = [timeBuckets: TimeBucket]

	static mapping = {
		timeBuckets cascade: "all-delete-orphan"
		timeBuckets sort:'start'
	}

	static constraints = {
	}
}
