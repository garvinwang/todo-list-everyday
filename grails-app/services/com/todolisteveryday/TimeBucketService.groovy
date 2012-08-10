package com.todolisteveryday

class TimeBucketService {

	WorkingTimeService workingTimeService

	def createTimeBucket(String start,String end){
		def workingTime = workingTimeService.getWoringTime()
		TimeBucket timeBucket = new TimeBucket()
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH-mm")
		timeBucket.start = (Date)formatter.parse(start)
		timeBucket.end = (Date)formatter.parse(end)

		workingTimeService.addTimeBucket(workingTime, timeBucket)

		updateWorkingTimeTotalMinites()
	}

	def getTimeBucket(id){
		TimeBucket.get(id)
	}

	def updateTimeBucket(timeBucket,String start,String end){
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH-mm")
		timeBucket.start = (Date)formatter.parse(start)
		timeBucket.end = (Date)formatter.parse(end)
		timeBucket.save(flush:true)

		updateWorkingTimeTotalMinites()
	}

	def deleteTimeBucket(id){
		def timeBucket = getTimeBucket(id)
		workingTimeService.deleteTimeBucket(timeBucket)

		updateWorkingTimeTotalMinites()
	}

	private def caculateBucket(timeBucket) {
		def start = timeBucket.start
		def end = timeBucket.end
		def hours = end.hours - start.hours
		def minutes = end.minutes - start.minutes

		return hours * 60 + minutes
	}

	private def updateWorkingTimeTotalMinites() {
		def workingTime = workingTimeService.getWoringTime()
		def totalMinites = 0
		workingTime.timeBuckets.each{ totalMinites += caculateBucket(it) }

		workingTime.totalMinites = totalMinites
		workingTime.save(flush:true)
	}

	def getLeftTimeFromTimeBucket(currentTime,timeBuck){
		def start = timeBuck.start
		def end = timeBuck.end

		def hours = end.hours - currentTime.hours
		def minutes = end.minutes - currentTime.minutes
		def sum = hours * 60 + minutes

		if(sum <= 0){
			return 0
		}else{
			return sum
		}
	}
}
