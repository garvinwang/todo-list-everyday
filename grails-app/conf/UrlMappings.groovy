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
		
		"/"(controller:"home")
		
		"500"(view:'/error')
	}
}
