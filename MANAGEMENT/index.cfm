
	<head>
		<meta charset="utf-8">
		<title>Management</title>
		<link href="../includes/bootstrap/css/bootstrap.css" rel="stylesheet" />
		<link href="../Home/mycss.css" rel="stylesheet" />
		<script src="../includes/ckeditor/ckeditor.js" type="text/javascript"></script>
	</head>
	<cfparam name="tool" default="addedit">
	<cfif not session.user.isadmin>
        <cflocation url="../Home/index.cfm" />
    </cfif>
	<body>
		<div id="wrapper" class="container">
		  <div id="topHeader" class="row">
			<cfinclude template="../Home/header.cfm">
		  </div>
		  <div id="horizontalnav" class="row">
			<cfinclude template="managementnav.cfm">
		  </div>
		  <div id="maincontent" class="row">
			<div id="center" class="col-lg-12 row">
			  <cfinclude template="#tool#.cfm">
			</div>
		  </div>
		  <div id="footer" class="row">
			<cfinclude template="../Home/footer.cfm">
		  </div>
		</div>
	</body>

