<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>

</head>
<body>


	<section id="global">
		<div class="row">

			<div class="span3">

				<a class="btn btn-large btn-primary" href="#"
					style="width: 240px; height: 50px; align: center; font-size: 30px; vertical-align: middle; display: table-cell;"
					onfocus="this.blur()"><i class="icon-list icon-white"></i> New
					Todo List</a>

				<hr>

				<h1>Application Status</h1>
				<ul>
					<li>App version: <g:meta name="app.version" /></li>
					<li>Grails version: <g:meta name="app.grails.version" /></li>
					<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
					<li>JVM version: ${System.getProperty('java.version')}</li>
					<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
					<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
					<li>Domains: ${grailsApplication.domainClasses.size()}</li>
					<li>Services: ${grailsApplication.serviceClasses.size()}</li>
					<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
				</ul>
				<h1>Installed Plugins</h1>
				<ul>
					<g:each var="plugin"
						in="${applicationContext.getBean('pluginManager').allPlugins}">
						<li>
							${plugin.name} - ${plugin.version}
						</li>
					</g:each>
				</ul>
			</div>


			<div class="span9">
				<h1>Welcome to Grails</h1>
				<p>Congratulations, you have successfully started your first
					Grails application! At the moment this is the default page, feel
					free to modify it to either redirect to a controller or display
					whatever content you may choose. Below is a list of controllers
					that are currently deployed in this application, click on each to
					execute its default action:</p>

				<div>
					<h2>Available Controllers:</h2>
					<ul>
						<g:each var="c"
							in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li class="controller"><g:link
									controller="${c.logicalPropertyName}">
									${c.fullName}
								</g:link></li>
						</g:each>
					</ul>
				</div>
			</div>

		</div>

	</section>

</body>
</html>
