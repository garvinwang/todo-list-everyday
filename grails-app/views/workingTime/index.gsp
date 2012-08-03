<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

</head>
<body>

	<div class="well">
		<h2>
			Working Time Managment... <small>current total minites：${workingTime.totalMinites }</small>
		</h2>
		<hr>
		<h3>Time Buckets List</h3>
		<br />
		<ul class="nav nav-tabs nav-stacked">
			<g:each in="${workingTime.timeBuckets }">
				<li data-original-title="">Start:${it.start } End:${it.end }
				</li>
			</g:each>
		</ul>
		<br /> <a class="close" data-dismiss="alert" data-toggle="modal"
			href="#myModal"><i class="icon-pencil icon-white"></i> add new
			time bucket</a>
	</div>

	<div class="modal" id="myModal">
		<div class="modal-header">
			<a class="close" data-dismiss="modal"
				onclick="javascript:$('#myModal').modal('hide');">×</a>
			<h3>Add New Time Bucket</h3>
		</div>
		<div class="modal-body">
			<table>
				<tr>
					<td class="span4"><h4>Start Time:</h4> <input type="text" name="start"
						id="start" class="inputmask"
						value="" data-mask="23-59"></td>
					<td class="span4"><h4>End Time:</h4> <input type="text" name="end"
						id="end" class="inputmask"
						value="" data-mask="23-59"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<g:submitButton name="Save changes" class="btn btn-primary" />
			<a href="#" class="btn"
				onclick="javascript:$('#myModal').modal('hide');">Close</a>
		</div>
	</div>

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
	</script>

</body>
</html>
