<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-wysihtml5.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'jQuery-Timepicker-Addon', file: 'jquery-ui-timepicker-addon.css')}" type="text/css">

</head>
<body>


	<section id="global">
		<div class="row">
		
			<!-- left menu -->
			<div class="span3">
			
				<h2>${todo?.todoList?.title }</h2>
				<hr>
				
				<g:if test="${partners.size()>1  }">
					<h3>Partner Todo</h3>
					
					<ul class="nav nav-tabs nav-stacked">
						<g:each in="${partners}">
						<g:if test="${it.id != todo.id }">
							<li><g:link action="detail" id="${it.id }">
									<h4>
										${it.description }
									</h4>
								</g:link></li>
						</g:if>
						</g:each>
					</ul>
					<hr>
				</g:if>

				<div class="btn-group">
		          <a class="btn btn-large btn-success dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-cog"></i> Current Todo Operations<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li>
		            	<g:remoteLink action="start" id="${todo?.id}" onSuccess="startSucess(data)"><i class="icon-ok"></i> Start</g:remoteLink>
		            </li>
		            <li>
		            	<g:remoteLink action="interrupt" id="${todo?.id}" onSuccess="interruptSucess(data)"><i class="icon-repeat"></i> Interrupt</g:remoteLink>
		            </li>
		            <li>
		            	<g:remoteLink action="delay" id="${todo?.id}" onSuccess="delaySucess(data)"><i class="icon-time"></i> Delay</g:remoteLink>
		            </li>
		            <li>
		            	<g:remoteLink action="finish" id="${todo?.id}" onSuccess="finishSucess(data)"><i class="icon-thumbs-up"></i> Finish</g:remoteLink>
		            </li>
		            <li>
		            	<g:remoteLink action="cancel" id="${todo?.id}" onSuccess="cancelSucess(data)"><i class="icon-remove"></i> Cancel</g:remoteLink>
		            </li>
		            <li class="divider"></li>
		            <li>
		            	<a href="#" onclick="javascrsipt:addExecuteLog(${todo?.id})"><i class="icomoon-edit"></i> Create New Execute Log</a>
		            </li>
		          </ul>
		        </div>
				
				<br/>
				
				<g:link controller="todoList" action="edit" id="${todo?.todoList?.id }" class="btn btn-large btn-danger">
					<i class="icon-fast-backward icon-white"></i> Back to Todo List</g:link>
			</div>

			<!-- content -->
			<div class="span9">
				<h2 class="editable" id="${todo?.id}">
					${todo?.description}
				</h2>
				<hr>
				<div id="todo_div">
						<div class="alert alert-info" id="${todo?.id}">
							
							（当前状态：<strong id="status_display_string">${todo?.todoStatus?.displayString }</strong>
							<g:if test="${todo?.todoStatus?.displayString == '延期'}">
								=> <g:link class="btn" controller="todo" action="doToday" id="${todo?.id}">Do Now</g:link>
							</g:if>
							）&nbsp; 
							<g:if test="${todo?.consumption }">
							耗时：<strong>${todo?.consumption }</strong>分钟
							</g:if>
						</div>
						
						<!-- execute log history div -->
						<div id="execute_log_history_div">
							<g:each in="${todo?.todoExecutionLogs }">
								<div class="alert alert-warning">
									<a class="close" data-dismiss="alert" onclick="javascript:deleteLog(${it?.id})"><i class="icon-remove icon-white"></i></a>
									<a class="close" data-dismiss="alert" data-toggle="modal" href="#myModal_${it?.id}"><i class="icon-pencil icon-white"></i>&nbsp;&nbsp;</a>
									<table style="width:100%">
					            		<tr>
					            			<td class="span4"><h3>Start Time: <small><g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.start }"/></small></h3></td>
					            			<td class="span4"><h3>End Time: <small><g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.end }"/></small></h3></td>
					            		</tr>
					            		<g:if test="${it?.description }">
					            		<tr>
					            			<td colspan="2">
					            				<h3>Description:</h3>
					            				<pre>${it?.description }</pre>
					            			</td>
					            		</tr>
					            		</g:if>
					            	</table>
								</div>
								
								<div class="modal" id="myModal_${it?.id}">
									<g:formRemote name="execute_log_form_${it?.id}" url="[controller: 'todoExecutionLog', action:'update']" onSuccess="createLogSuccess(data)" method="post">
									  <g:hiddenField name="id" value="${it?.id }"/>
									  <div class="modal-header">
									    <a class="close" data-dismiss="modal" onclick="javascript:$('#myModal_${it?.id}').modal('hide');">×</a>
									    <h3><g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.start }"/></h3>
									  </div>
									  <div class="modal-body">
									    <table style="width:50%">
						            		<tr>
						            			<td><h4>Start Time:</h4> <input type="text" name="start" id="start_${it?.id}" class="timepicker" value="<g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.start }"/>"></td>
						            			<td><h4>End Time:</h4> <input type="text" name="end" id="end_${it?.id}" class="timepicker" value="<g:formatDate format="yyyy-MM-dd HH:mm" date="${it?.end }"/>"></td>
						            		</tr>
						            		<tr>
						            			<td colspan="2">
						            				<h4>Description:</h4>
						            				<textarea id="description" name="description" class="textarea" placeholder="Enter Log Description ..." style="width: 500px; height: 200px">${it?.description }</textarea>
						            			</td>
						            		</tr>
						            	</table>
									  </div>
									  <div class="modal-footer">
									  	<g:submitButton name="Save changes"  class="btn btn-primary"/>
									    <a href="#" class="btn" onclick="javascript:$('#myModal_${it?.id}').modal('hide');">Close</a>
									  </div>
								  </g:formRemote>
								</div>
								
							</g:each>
						</div>
						
						
						
						
						
			            <!-- execute log div -->
			            <div class="alert alert-warning" id="execute_log_div">
			            	<g:formRemote name="execute_log_form" url="[controller: 'todoExecutionLog', action:'create']" onSuccess="createLogSuccess(data)" method="post">
			            	<g:hiddenField name="todo_id"/>
			            	<table style="width:100%">
			            		<tr>
			            			<td><h4>Start Time:</h4> <input type="text" name="start" id="start" class="timepicker_new"></td>
			            			<td><h4>End Time:</h4> <input type="text" name="end" id="end" class="timepicker_new"></td>
			            		</tr>
			            		<tr>
			            			<td colspan="2">
			            				<h4>Description:</h4>
			            				<textarea id="description" name="description" class="textarea" placeholder="Enter Log Description ..." style="width: 810px; height: 200px"></textarea>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td colspan="2">
			            				<g:submitButton id="save_button" name="Save"  class="btn btn-primary"/>
			            				<a href="#" class="btn" onclick="javascript:$('#execute_log_div').hide();">Cancel</a>
			            			</td>
			            		</tr>
			            	</table>
			            	</g:formRemote>
			            </div>
			            
			            <div class="well">
			            	<h4>Remark:</h4>
			            	<br/>
			            	<g:formRemote name="update_remark" on404="alert('not found!')" onSuccess="updateRemarkSuccess(data)"
								url="[controller: 'todo', action:'updateRemark']" method="POST">
								<input id="id" name="id" type="hidden" value="${todo?.id }" />
								<textarea id="remark" name="remark" class="textarea" placeholder="Enter Remark Text ..." style="width: 810px; height: 200px">${todo?.remark }</textarea>
								<p id="textarea_changed_label"></p>
								<g:submitButton id="update_remark_button" name="update remark" action="updateRemark" class="btn btn-primary" style="display:none"/>
								<small id="update_remark_lable" style="display:none"> ( Remember press "Update Remark" button after modified the remark content )</small>
							</g:formRemote>
			            </div>
						
				</div>
			</div>

			<g:formRemote name="delete_form" on404="alert('not found!')"
				onSuccess="deleteSucess(data)" onComplete="deleteComplete()"
				url="[controller: 'todo', action:'delete']" method="POST">
				<input id="id" name="id" type="hidden" />
			</g:formRemote>

			<g:formRemote name="update_form" on404="alert('not found!')"
				url="[controller: 'todo', action:'update']" method="POST">
				<input id="id" name="id" type="hidden" />
				<input id="description" name="description" type="hidden" />
			</g:formRemote>
			
			<g:formRemote name="delete_log_form" on404="alert('not found!')"
				onSuccess="deleteLogSuccess(data)" 
				url="[controller: 'todoExecutionLog', action:'delete']" method="POST">
				<input id="id" name="id" type="hidden" />
			</g:formRemote>
			
			

		</div>

	</section>
	<g:javascript src="jquery.inlineEdit.js"></g:javascript>
	<script type="text/javascript" src="${resource(dir: 'kickstrap/js', file: 'bootstrap-dropdown.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'kickstrap/js', file: 'bootstrap-modal.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'wysihtml5-0.3.0.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-wysihtml5.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.hotkeys-0.7.9.min.js')}"></script>
	
	
	<script type="text/javascript" src="${resource(dir: 'jQuery-Timepicker-Addon', file: 'jquery-ui-timepicker-addon.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'jQuery-Timepicker-Addon', file: 'jquery-ui-sliderAccess.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'jQuery-Timepicker-Addon/localization', file: 'jquery-ui-timepicker-zh-CN.js')}"></script>
	
	<script type="text/javascript">
	
	var deleteTodo = function(id){
		if(confirm('Are you sure?')){
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
		     //if(confirm('Change title to '+ data.value +'?')){
		    	 $('#update_form #id').val(data.id);
		    	 $('#update_form #description').val(data.value);
		    	 $('#update_form').submit();
			 //}
		   }
		 });
	}
	flashEditableItems();

	
	var startSucess = function(data){
		doAlert(data);
		$('#status_display_string').html("进行中");
	}
	var interruptSucess = function(data){
		doAlert(data);
		$('#status_display_string').html("暂停");
	}
	var delaySucess = function(data){
		doAlert(data);
		$('#status_display_string').html("延期");
	}
	var finishSucess = function(data){
		doAlert(data);
		$('#status_display_string').html("完成");
	}
	var cancelSucess = function(data){
		doAlert(data);
		$('#status_display_string').html("取消");
	}
	var doAlert = function(data){
		if(data == 0){
			//alert("Do failed");
		}else{
			//alert("Do successed");
		}
	}

	var updateRemarkSuccess = function(){
		alert('Update Success!');
		$('#update_remark_button').hide();
	    $('#update_remark_lable').hide();
	}

	$('.textarea').wysihtml5();
	
	var remarkText = "${todo?.remark?.encodeAsHTML()}";
	var remarkText2 = "${todo?.remark?.encodeAsHTML()}";
	var updateRemarkTips = function(){
	    if ($('#remark').val() != remarkText) {
		    /**
	        $("#textarea_changed_label").text($('#remark').val());
	        // text changed
	        remarkText = $('#remark').val();
	        if(remarkText2 == remarkText){
	        	$("#textarea_changed_label").text("");
		    }
		    **/
		    $('#update_remark_button').show();
		    $('#update_remark_lable').show();
	    }
	}

    
    $('.timepicker').datetimepicker();
    //ex13.datetimepicker('getDate')
    
    
    var addExecuteLog = function(todo_id){
    	var start = $('#execute_log_form #start');
        var end = $('#execute_log_form #end');
        start.datetimepicker();
        end.datetimepicker();
    	start.datetimepicker('setDate', (new Date()));
    	$('#execute_log_div').show();
    	$('#execute_log_div #todo_id').val(todo_id);
    }

    var createLogSuccess = function(data){
    	window.location.reload(); 
    }

	var deleteLog = function(id){
		if(confirm("你确定删除吗？")){
			$('#delete_log_form #id').val(id);
			$('#delete_log_form').submit();
		}
	}
	var deleteLogSuccess = function(data){
		if(data == "1"){
			alert("删除成功！");
			window.location.reload(); 
		}
	}

    $(document).ready(function() {

    	//jQuery(document).bind('keydown', 'Alt+s',function (evt){jQuery('#_Alt_s').addClass('textarea'); return false; });
    	//jQuery.hotkeys.add('Ctrl+s',function (){
	    	//jQuery('#_Shift_s').addClass('textarea')
			//$('#update_remark').submit();
	    //});
    	
    	$('#execute_log_div').hide();

		$('.modal').hide();
    });

	

</script>
</body>
</html>
