<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Welcome to "Todo List Everyday"</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">

<link rel="stylesheet"
	href="${resource(dir: 'kickstrap/css', file: 'bootstrap.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'kickstrap/css', file: 'responsive.css')}"
	type="text/css">
<style type="text/css">
#toTop {
	width:400px;
	height: 5px;
    text-align:center;
    padding:5px;
    position:fixed; /* this is the magic */
    top:10px; /* together with this to put the div at the bottom*/
    right:10px;
    cursor:pointer;
    display:none;
}
.cntSeparator {
	font-size: 54px;
	margin: 25px 7px;
	color: black;
}
</style>

<g:javascript library="jquery" />
<g:javascript library="jquery-ui" />
<g:layoutHead />
<r:layoutResources />
</head>

<body data-spy="scroll" data-target=".subnav" data-offset="50">
	<br>
	<div class="container">
		<div class="row">
			<div class="span8">
				<h1>
					<a href="${createLink(controller:'home')}"><i
						class="icon-home icon-white"></i></a> Todo List Everyday ... <small>Maintain
						"Todo List" everyday.</small>
				</h1>
			</div>
			<div id="left_time" style="" class="span4">
			</div>
		</div>

		<hr>

		<g:layoutBody />

		<hr>

		<footer class="footer">
			<div class="row">
				<div class="span3">
					<h4>Email:</h4>
					<strong>garvin.wang</strong>[at]<strong>gmail.com</strong>
					<h4>My home</h4>
					<a href="http://www.wanghai1024.com" target="_blank">www.wanghai1024.com</a>
				</div>
				<div class="span3">
					<h4>Source:</h4>
					<a href="https://github.com/garvinwang/todo-list-everyday"
						target="_blank">github.com/garvinwang/todo-list-everyday</a>
				</div>
				<div class="span3">
					<h4>V 0.5:</h4>
					2012-07-24 ~ 2012-07-27
					<h4>V 0.6:</h4>
					2012-07-31 ~ 2012-08-02
				</div>
				<div class="span3">
					<p class="pull-right ">
						<a class="btn" href="#"><i class="icon-arrow-up"></i> Back to
							top</a>
					</p>
				</div>
			</div>
		</footer>

	</div>
	<div id="toTop"></div>
	<g:javascript library="application" />
	<r:layoutResources />
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.countdown.js')}"></script>
	<script type="text/javascript">
		
	$.get('<g:createLink controller="workingTime" action="ajaxLeftTime"></g:createLink>', function(data) {
	  if(data != ""){
		  $('#toTop').fadeIn();
		  $('#toTop').countdown({
		    stepTime: 60,
		    format: 'hh:mm:ss',
		    startTime: data,
		    digitImages: 6,
		    digitWidth: 53,
		    digitHeight: 77,
		    image: "${resource(dir: 'images', file: 'digits.png')}"
		  });
	  }
	});
	
	</script>
</body>
</html>