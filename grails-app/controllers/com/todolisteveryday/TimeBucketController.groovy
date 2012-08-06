package com.todolisteveryday

class TimeBucketController {

	TimeBucketService timeBucketService

	def create() {
		def start = params.start
		def end = params.end

		if(start && end){
			timeBucketService.createTimeBucket(start, end)
			render "1"
		}else{
			render "0"
		}
	}

	def update(){
		def id = params.id
		def start = params.start
		def end = params.end
		if(id && start && end){
			def timeBucket = timeBucketService.getTimeBucket(id)
			timeBucketService.updateTimeBucket(timeBucket, start, end)
			render "1"
		}else{
			render "0"
		}
	}

	def delete(){
		if(params.id){
			timeBucketService.deleteTimeBucket(params.id)
			render "1"
		}else{
			render "0"
		}
	}
}
