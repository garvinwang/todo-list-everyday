class UrlMappings {

	static mappings = {
		//		"/$controller/$action?/$id?"{
		//			constraints {
		//				// apply constraints here
		//			}
		//		}
		
		"/todolist/$action?/$id?"(controller:"todoList")
		"/todo/$action?/$id?"(controller:"todo")
		"/todoexecutionlog/$action?/$id?"(controller:"todoExecutionLog")
		
		"/workingtime/$action?/$id?"(controller:"workingTime")
		"/timebucket/$action?/$id?"(controller:"timeBucket")
		
		"/"(controller:"home")
		
		"500"(view:'/error')
	}
}
