package com.todolisteveryday

class TimeBucketService {

	WorkingTimeService workingTimeService
	
    def caculateBucket(timeBucket) {
		def start = timeBucket.start
		def end = timeBucket.end
		def hours = end.hours - start.hours
		def minites = end.minites - start.minites
		
		return hours * 60 + minites
    }
	
	def createTimeBucket(workingTime,String start,String end){
		TimeBucket timeBucket = new TimeBucket()
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-M-dd hh:mm")
		timeBucket.start = (Date)formatter.parse(start)
		timeBucket.end = (Date)formatter.parse(end)
		
		workingTimeService.addTimeBucket(workingTime, timeBucket)
	}
	
	def updateTimeBucket(timeBucket,String start,String end){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-M-dd hh:mm")
		timeBucket.start = (Date)formatter.parse(start)
		timeBucket.end = (Date)formatter.parse(end)
		timeBucket.save(flush:true)
	}
	
	def deleteTimeBucket(timeBucket){
		workingTimeService.deleteTimeBucket(workingTime, timeBucket)
	}
}
