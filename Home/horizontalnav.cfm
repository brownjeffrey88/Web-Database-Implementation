
<nav class="navbar navbar-default" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#"><img src="../Home/images/kisspng-book-flat-design-books-5ac984c615b442.9026687715231561660889.png" width="30" height="30" alt=""></a>
  </div>

  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="../Home/index.cfm">Home</a></li>
      <li><a href="index.cfm?p=content&contentid=780991D5-09D6-5FD3-96B72928A1B45697">Information</a></li>
      <li><a href="index.cfm?p=content&contentid=780B49BE-E0D8-FB0D-5D7F23C922059A3E">Featured</a></li>
      <li><a href="index.cfm?p=content&contentid=780C8D4A-DDB7-97F3-9614FB7E8E42DC76">Events</a></li>
		
		<cfoutput>
                    <li>
                        <form class="navbar-form navbar-left" role="search" action="#cgi.script_name#?p=details" method="post">
					  <div class="form-group">
						<input type="text" class="form-control" placeholder="Search" name="searchme">
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form> 
                    </li>
                </cfoutput>
	</ul>
    <ul class="nav navbar-nav navbar-right">
      <li>
		  <cfoutput>
                <ul class="nav navbar-nav navbar-right">
                    <cfif session.isLoggedIn>
                        <li><a>Welcome #session.user.firstname#</a></li>
                        <cfif session.user.isadmin>
                                <li><a href="../MANAGEMENT/index.cfm">Management</a></li>
                        </cfif>
                        <li><a href="#cgi.script_name#?p=logoff">Logout</a></li>
                    <cfelse>
                        <li><a href="#cgi.script_name#?p=login">Login</a></li>
                    </cfif>
                </ul>
            </cfoutput>
	</li>

    </ul>
  </div>
</nav>