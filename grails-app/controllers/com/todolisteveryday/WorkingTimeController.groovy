package com.todolisteveryday

class WorkingTimeController {

	WorkingTimeService workingTimeService
	TimeBucketService timeBucketService

	def index() {
		[workingTime:workingTimeService.getWoringTime()]
	}

	def ajaxLeftTime(){
		def workingTime = workingTimeService.getWoringTime()
		Date currentTime = new Date()
		int leftTime = 0
		workingTime.timeBuckets.each{
			leftTime += timeBucketService.getLeftTimeFromTimeBucket(currentTime,it)
		}
		if(leftTime == 0){
			render ""
		}else{
			int hour = (int)(leftTime/60)
			int minute = leftTime - hour * 60
			def finalStr = ""
			if(hour>10){
				finalStr += hour
			}else{
				finalStr += '0' + hour
			}
			finalStr += ':'
			if(minute>10){
				finalStr += minute
			}else{
				finalStr += '0' + minute
			}
			finalStr += ":"
			if(currentTime.seconds>10){
				finalStr += currentTime.seconds
			}else{
				finalStr += '0' + currentTime.seconds
			}
			render finalStr
		}
	}
}
