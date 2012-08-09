<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

</head>
<body>


	<section id="global">
		<div class="row">
			<!-- left menu -->
			<div class="span3">
				<h2>Last 15 Days Todo List</h2>
				<hr>
				<ul class="nav nav-tabs nav-stacked">
					<g:each in="${historyTodlList }">
						<li <g:if test="${it.id == todoList.id }">class="active"</g:if>
							data-original-title=""><g:link action="edit" id="${it.id }">
								<h4>
									<g:if test="${it.id == todoList.id }">>>> </g:if>
									${it.title }
									<g:if test="${it?.todos?.size()>0 }">（共 ${it?.todos?.size() } 项）</g:if>
								</h4>
							</g:link></li>
					</g:each>
				</ul>

				<hr>

				<g:link action="index" class="btn btn-large btn-danger">
					<i class="icon-fast-backward icon-white"></i> Back to History Todo List</g:link>
			</div>

			<!-- content -->
			<div class="span9">
				<h2>
					（${todoList.title} 's Todo List）...<small id="consume"></small>
				</h2>
				<hr>
				<div id="todo_div">
				
					<g:set var="consume" value="${0}"/>
					
					<g:each status="i" var="todo" in="${todoList.todos}">
						
						<div class="alert alert-info" id="${todo?.id}">
							<a class="close" data-dismiss="alert"
								onclick="javascript:deleteTodo(${todo?.id});">×</a>
								
							
							<table>
								<tr>
									<td>
										<a href="#" class="btn btn-large btn-inverse disabled">${i+1 }</a>&nbsp;
									</td>
									<td>
										<h3 class="editable" id="${todo?.id}">
											${todo?.description}
										</h3>
									</td>
								</tr>
							</table>
							
							<g:if test="${todo?.todoExecutionLogs }">
								<hr>
								<g:each in="${todo?.todoExecutionLogs }">
									<h4>
										<i class="icon-play icon-white">&nbsp;</i>
										<g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.start }"/> ~ <g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.end }"/>
									</h4>
									<g:if test="${it?.description }">
										<pre>${it?.description }</pre>
									</g:if>
								</g:each>
							</g:if>
							
							<g:if test="${todo?.remark }">
							<hr>
							<h4>
							<i class="icon-book icon-white">&nbsp;</i>
							Remark:
							</h4>
							<pre>${todo?.remark }</pre>
							</g:if>
							
							<hr>
							
							<g:link class="btn btn-primary" controller="todo" action="detail" id="${todo?.id}"><i class="icon-pencil icon-white">&nbsp;</i>Maintain Detail</g:link>
							&nbsp;
							（当前状态：<strong id="status_display_string">${todo?.todoStatus?.displayString }</strong>）&nbsp;
							<g:if test="${todo?.consumption }">
							耗时：<strong>${todo?.consumption }</strong>分钟
							<g:set var="consume" value="${consume + todo?.consumption }"/>
							</g:if>
							
						</div>
					</g:each>
				</div>

				<a class="btn btn-success" href="#" onclick="javascript:addNew();"><i
					class="icon-external-link icon-white"></i> Create New Todo</a>
			</div>

			<g:formRemote name="create_form" on404="alert('not found!')"
				onSuccess="appendNewTodo(data)"
				url="[controller: 'todo', action:'create']" method="POST">
				<input id="description" name="description" type="hidden" />
				<input id="todoListId" name="todoListId" type="hidden"
					value="${todoList.id}" />
			</g:formRemote>

			<g:formRemote name="delete_form" on404="alert('not found!')"
				onSuccess="deleteSucess(data)" onComplete="deleteComplete()"
				url="[controller: 'todo', action:'delete']" method="POST">
				<input id="id" name="id" type="hidden" />
			</g:formRemote>

			<g:formRemote name="update_form" on404="alert('not found!')"
				onSuccess="updateSucess(data)"
				url="[controller: 'todo', action:'update']" method="POST">
				<input id="id" name="id" type="hidden" />
				<input id="description" name="description" type="hidden" />
			</g:formRemote>

		</div>

	</section>
	<g:javascript src="jquery.inlineEdit.js"></g:javascript>
	<script type="text/javascript">
	
	var addNew = function(){
		$('#todo_div').append('<div id="new_todo" class="alert alert-block"><input class="input-xlarge span8" id="new_todo_description_temp" type="text"><p class="help-block">Information about this todo item.</p><hr><a class="btn btn-success" href="#" onclick="javascript:create();">Create</a>&nbsp;<a class="btn btn-danger" href="#" onclick="javascript:cancel();">Cancel</a></div>');
	}
	var cancel = function(){
		$('#new_todo').remove();
	}
	var create = function(){
		$('#description').val($('#new_todo_description_temp').val());
		$('#create_form').submit();
	}
	var appendNewTodo = function(data){
		cancel();
		$('#todo_div').append('<div id="'+data.id+'" class="alert alert-info"><a class="close" data-dismiss="alert" onclick="javascript:deleteTodo('+data.id+');">×</a><h3 class="editable" id="'+data.id+'">'+data.description+'</h3><hr><a class="btn btn-danger" href="${createLink(controller:'home')}todo/detail/'+data.id+'">Maintain Detail</a></div>');
		flashEditableItems();
	}
	var deleteTodo = function(id){
		if(confirm('You want to delete this todo?')){
			$('#delete_form #id').val(id);
			$('#delete_form').submit();
		}
	}
	var deleteSucess = function(data){
		if(data == 0){
			alert("delete failed");
		}else{
			alert("delete successed");
		}
	}
	var deleteComplete = function(){
		var id = $('#delete_form #id').val();
		$('#todo_div #' + id).remove();
	}
	var flashEditableItems = function(){
		$('.editable').inlineEdit({
		   buttonText: 'Save',
		   save: function(e, data) {
		     if(confirm('Change name to '+ data.value +'?')){
		    	 $('#update_form #id').val(data.id);
		    	 $('#update_form #description').val(data.value);
		    	 $('#update_form').submit();
			 }
		   }
		 });
	}
	flashEditableItems();
	
	var updateSucess = function(data){
		if(data == 0){
			alert("update failed");
		}else{
			alert("update successed");
		}
	}
	<g:if test="${consume>0}">
	var consume = ${consume};
	$('#consume').html(' 总耗时：'+consume +' 分钟');
	</g:if>
</script>
</body>
</html>
