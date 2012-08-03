<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

</head>
<body>


	<section id="global">
		<div class="row">
			
			<!--  -->
			<div class="span3">
				<g:link action="create" class="btn btn-large btn-danger">
					<i class="icon-list icon-white"></i> Create Today Todo List</g:link>

				<hr>

				<h2>Last Finished Todo</h2>
				<ul class="nav nav-tabs nav-stacked">
					<g:each in="${lastTodo }">
						<li>
						<g:link controller="todolist" action="edit" id="${it.todoList.id }"><b>${it.todoList.title }：</b><br/>${it.description }</g:link>
						</li>
					</g:each>
				</ul>
			</div>

			<!--  -->
			<div class="span9">
				<h2>Todo History List</h2>
				<hr>
				<g:each var="todoList" in="${historyList}">
					<div class="alert alert-info">
						<g:link action="edit" id="${todoList.id}">
							<h3>
								${todoList.title}
							</h3>
						</g:link>
						<ol>
							<g:each in="${todoList.todos }">
								<li data-original-title="">
									<g:if test="${it.todoStatus.displayString == '完成' }">（F）</g:if>
									<g:if test="${it.todoStatus.displayString == '准备' }">（R）</g:if>
									<g:if test="${it.todoStatus.displayString == '暂停' }">（I）</g:if>
									<g:if test="${it.todoStatus.displayString == '进行中' }">（P）</g:if>
									<g:if test="${it.todoStatus.displayString == '延期' }">（D）</g:if>
									<g:if test="${it.todoStatus.displayString == '取消' }">（C）</g:if>
									${it.description }
								</li>
							</g:each>
						</ol>
					</div>
				</g:each>
			</div>

		</div>

	</section>

</body>
</html>
