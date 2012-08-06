<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

</head>
<body>

	<div class="well">
		<h2>
			Working Time Managment... <small>current total minites：${workingTime.totalMinites }'</small>
		</h2>
		<hr>
		<h3>Time Buckets List</h3>
		<br />
		<!-- time buckets list -->
		<ul class="nav nav-tabs nav-stacked">
			<g:each in="${workingTime.timeBuckets }">
				<li data-original-title="">
					<div class="alert alert-warning">
						<strong>Start: </strong>
						<g:formatDate format="HH:mm" date="${it?.start }" />
						<strong>End: </strong>
						<g:formatDate format="HH:mm" date="${it?.end }" />
						&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-small btn-info"
							href="javascript:edit('${it?.id }','<g:formatDate format="HH-mm" date="${it?.start }" />','<g:formatDate format="HH-mm" date="${it?.end }" />');"><i
							class="icon-info-sign icon-white"></i> Edit</a>
						<g:remoteLink class="btn btn-small btn-danger"
							controller="timeBucket" action="delete" id="${it?.id }"
							before="if(!confirm('Are you sure?')) return false" method="post"
							onSuccess="deleteSuccess(data)">
							<i class="icon-remove icon-white"></i> Delete</g:remoteLink>
					</div>
				</li>
			</g:each>
		</ul>
		<br /> <a class="btn .btn-success" href="javascript:newModalShow()"><i
			class="icon-pencil icon-white"></i> add new time bucket</a>
	</div>

	<!-- add new time bucket -->
	<div class="modal" id="new_modal">
		<g:formRemote name="add_new_time_bucket"
			url="[controller:'timeBucket',action:'create']"
			onSuccess="createSuccess(data)">
			<div class="modal-header">
				<a class="close" data-dismiss="modal" href="javascript:modalHide();">×</a>
				<h3>Add New Time Bucket</h3>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td class="span4"><h4>Start Time:</h4> <input type="text"
							name="start" id="start" class="inputmask" value=""
							data-mask="29-59"></td>
						<td class="span4"><h4>End Time:</h4> <input type="text"
							name="end" id="end" class="inputmask" value="" data-mask="29-59"></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<g:submitButton name="Save changes" class="btn btn-primary" />
				<a href="javascript:modalHide();" class="btn">Close</a>
			</div>
		</g:formRemote>
	</div>
	<!-- end -->
	<!-- eidt time bucket -->
	<div class="modal" id="edit_modal">
		<g:formRemote name="add_new_time_bucket"
			url="[controller:'timeBucket',action:'update']"
			onSuccess="updateSuccess(data)">
			<g:hiddenField name="id" value="" />
			<div class="modal-header">
				<a class="close" data-dismiss="modal" href="javascript:modalHide();">×</a>
				<h3>Edit New Time Bucket</h3>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td class="span4"><h4>Start Time:</h4> <input type="text"
							name="start" id="start" class="inputmask" value=""
							data-mask="29-59"></td>
						<td class="span4"><h4>End Time:</h4> <input type="text"
							name="end" id="end" class="inputmask" value="" data-mask="29-59"></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<g:submitButton name="Save changes" class="btn btn-primary" />
				<a href="javascript:modalHide();" class="btn">Close</a>
			</div>
		</g:formRemote>
	</div>
	<!-- end -->

	<script type="text/javascript"
		src="${resource(dir: 'kickstrap/js', file: 'bootstrap-modal.js')}"></script>
	<script type="text/javascript"
		src="${resource(dir: 'js', file: 'bootstrap-inputmask.js')}"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#execute_log_div').hide();

			$('.modal').hide();

			$('.inputmask').inputmask();
		});

		var createSuccess = function(data) {
			if (data == "1") {
				window.location.reload();
			} else {
				alert("create failed!");
			}
		}
		var updateSuccess = function(data) {
			if (data == "1") {
				window.location.reload();
			} else {
				alert("update failed!");
			}
		}
		var deleteSuccess = function(data) {
			if (data == "1") {
				window.location.reload();
			} else {
				alert("delete failed!");
			}
		}
		var edit = function(id, start, end) {
			editModalShow(id, start, end);
		}
		var editModalShow = function(id, start, end) {
			$('#edit_modal #id').val(id);
			$('#edit_modal #start').val(start);
			$('#edit_modal #end').val(end);
			$('#edit_modal').show();
		}
		var newModalShow = function() {
			$('#new_modal').show();
		}
		var modalHide = function() {
			$('.modal').hide();
		}
	</script>

</body>
</html>
