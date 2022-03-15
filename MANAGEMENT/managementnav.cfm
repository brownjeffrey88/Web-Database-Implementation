<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#manageNav">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.cfm">
                <img src="../Home/images/kisspng-book-flat-design-books-5ac984c615b442.9026687715231561660889.png" width="30" height="30" alt=""/>
            </a>
        </div>
        <cfoutput>
            <div class="collapse navbar-collapse" id="manageNav">
                <ul class="nav navbar-nav">
					<li class="active"><a href="../Home/index.cfm">Home</a></li>
                    <li><a href="#cgi.script_name#?tool=addedit">Add Edit</a></li>
                    <li><a href="#cgi.script_name#?tool=createuuids">Create UUIDs</a></li>
					<li><a href="#cgi.script_name#?tool=content">Content</a></li>
                </ul>
				 <cfoutput>
					 <li>
					 <form class="navbar-form navbar-left" role="search" action="#cgi.SCRIPT_NAME#?p=details" method="post">
					  <div class="form-group">
						<input type="text" class="form-control" placeholder="Search" name="searchme">
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form> 
						</li>
				</cfoutput>
				
            </div>
        </cfoutput>
    </div>
</nav>