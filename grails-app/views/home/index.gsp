<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

</head>
<body>


	<section id="global">
		<div class="row">

			<div class="span12">
				<g:link controller="todoList" action="index" class="btn btn-large btn-primary">
					<i class="icon-list icon-white"></i> View All Todo History List</g:link>
					&nbsp;
				<g:link controller="todoList" action="create" class="btn btn-large btn-danger">
					<i class="icon-list icon-white"></i> Create Today Todo List</g:link>
					&nbsp;
				<g:link controller="workingTime" action="index" class="btn btn-large btn-info">
					<i class="icon-time icon-white"></i> Working Time Maintain</g:link>
			</div>

		</div>
		<div class="row">

			<div class="span4">
				<h3>Finished Todo</h3>
				<br/>
				<ul class="nav nav-tabs nav-stacked">
			        <g:each in="${finishTodos }">
						<li data-original-title="">
						<g:link controller="todolist" action="edit" id="${it.todoList.id }"><b>${it.todoList.title }：</b><br/>${it.description }</g:link>
						</li>
					</g:each>
			    </ul>
				
			</div>
			
			<div class="span4">
				<h3>Processing Todo</h3>
				<br/>
				<ul class="nav nav-tabs nav-stacked">
			        <g:each in="${processTodos }">
						<li data-original-title="">
						<g:link controller="todolist" action="edit" id="${it.todoList.id }"><b>${it.todoList.title }：</b><br/>${it.description }</g:link>
						</li>
					</g:each>
			    </ul>	
			    
			    <h3>Ready Todo</h3>
				<br/>
				<ul class="nav nav-tabs nav-stacked">
			        <g:each in="${redayTodos }">
						<li data-original-title="">
						<g:link controller="todolist" action="edit" id="${it.todoList.id }"><b>${it.todoList.title }：</b><br/>${it.description }</g:link>
						</li>
					</g:each>
			    </ul>			
			</div>
			
			<div class="span4">
				<h3>Delay Todo</h3>
				<br/>
				<ul class="nav nav-tabs nav-stacked">
			        <g:each in="${delayTodos }">
						<li data-original-title="">
						<g:link controller="todolist" action="edit" id="${it.todoList.id }"><b>${it.todoList.title }：</b><br/>${it.description }</g:link>
						</li>
					</g:each>
			    </ul>
			</div>

		</div>

	</section>

</body>
</html>
