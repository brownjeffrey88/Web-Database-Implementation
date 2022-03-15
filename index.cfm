<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>UML Database Course - name</title>
    <link href="includes/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="includes/css/class.css" type="text/css" rel="stylesheet">
    <script src="includes/js/class.js" type="text/javascript"></script>
</head>
<cfparam name="content" default="" />
<cfif content neq ''>
	<cffile action="read" file="#expandpath('.')#/includes/#content#" variable="content" />
</cfif>

<cfdirectory directory="#expandpath('.')#" name="alldirs" recurse="no" type="dir">

<body>
	<div id="wrapper" class="col-lg-12">
    	<cfoutput>
			<div id="adminnav" style="float:none; clear:both; height:50px; ">
				<ul class="nav nav-pills" style="margin-left:auto; display:block; ">
					<li style="float:right"><a>Welcome #session.firstname#</a></li>
					<li style="float:right"><a href="https://uml.umassonline.net/" target="_blank">Class Blackboard Site</a> </li>
				</ul>
			</div>
		
        <div id="topheader">Class INFO 2480 Web Site Database Implementation - Local Host Table of Contents Page</div></cfoutput>
		<div id="mainarea">
			<div id="leftgutter" class="col-lg-3 col-md-3 col-sm-3">
				<ul class="nav nav-stacked">

					<cfoutput query="alldirs">
						<cfif name neq 'includes'>
							<li><a href="#name#" target="_blank">#name#</a></li>
						</cfif>
					</cfoutput>
				<li><hr/></li>
                <!---
					Add your custom links below this line.
					To keep the same formatting as the above items, use this format:
					 <li><a href="link to folder/file">Name of link </a></li>
					
				--->

				</ul>
			</div>
			<div id="center" class="col-lg-9 col-md-9 col-sm-9">
            	<cfoutput>
					<cfif content neq ''>
    	            	#content#
        	        </cfif>
				</cfoutput>
            </div>
		</div>
	</div>
</body>
</html>