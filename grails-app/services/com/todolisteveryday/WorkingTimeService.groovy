package com.todolisteveryday

class WorkingTimeService {

	def getTotalMinites(){
		def workingTimeList = WorkingTime.list()
		if(workingTimeList.size()==1){
			def workingTime = workingTimeList[0]
			return workingTime.totalMinites
		}else{
			return 0
		}
	}

	def getWoringTime(){
		def workingTimeList = WorkingTime.list()
		if( !workingTimeList || workingTimeList.size()==0){
			createWorkingTime()
		}else if(workingTimeList.size()==1){
			return workingTimeList[0]
		}else{
			workingTimeList.each{ it.delete() }
			createWorkingTime()
		}
	}

	def createWorkingTime(){
		WorkingTime workingTime = new WorkingTime()
		workingTime.save(flush:true)
	}


	def addTimeBucket(workingTime,timeBucket){
		workingTime.addToTimeBuckets(timeBucket).save(flush:true)
	}

	def deleteTimeBucket(timeBucket){
		def workingTime = WorkingTime.get(timeBucket.workingTime.id)
		workingTime.removeFromTimeBuckets(timeBucket).save(flush:true)
	}
}
