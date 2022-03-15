<cftry>
  <cfparam name="book" default="">
  <cfparam name="qterm" default="">
  <cfset processForms()>
	  
	      <script>
        function toggleNewISBNForm(){
            var newISBNArea=document.getElementById('newisbn13area');
            if(newISBNArea.style.display==='none'){
                newISBNArea.style.display='inline';
            }
            else{
                newISBNArea.style.display='none';
            }
        }
    </script>
	  
  <div id="main" class="col-lg-9 col-lg-push-3"> <cfoutput>#mainForm()#</cfoutput> </div>
  <div id="leftgutter" class="col-lg-3 col-lg-pull-9"> <cfoutput>#sideNav()#</cfoutput> </div>
  <cfcatch type="any">
    <cfoutput> #cfcatch.message# </cfoutput>
  </cfcatch>
</cftry>

<cffunction name="mainForm">
	<input type="hidden" name="qterm" value="#qterm#" />
  <cfif book neq ''>
    <cfquery name="thisbook" datasource="#application.dsource#">
            select * from books where isbn13='#book#'
        </cfquery>
    <cfquery name="allPubs" datasource="#application.dsource#">
            select * from publishers order by name
        </cfquery>
	  
        <cfquery name="allgenres" datasource="#application.dsource#">
            select * from genres order by genrename
        </cfquery>

        <cfquery name="bookgenres" datasource="#application.dsource#">
            select * from genresToBooks where bookid='#book#'
        </cfquery>
	  

        <cfset isbnfield="none">
        <cfset isbndisplay="inline">
        <cfset req=''>


        <cfif thisbook.isbn13[1] eq ''>
            <cfset isbnfield='inline'>
            <cfset isbndisplay='none'>
            <cfset req="required">
        </cfif>
	  
	  
    <cfoutput>
      <form action="#cgi.SCRIPT_NAME#?tool=#tool#&book=#url.book#" method="post" class="form-horizontal" enctype="multipart/form-data">
        <div class="form-group">
          <label for="isbn13" class="col-lg-3 control-label">ISBN13</label>
          <div class="col-lg-9">
             <span id="newisbn13area" style="display:#isbnfield#">
                            <input type="text" class="form-control" id="newisbn13" name="newisbn13" placeholder="ISBN13" value="#thisbook.isbn13[1]#" #req# pattern=".{13}" title="Please enter 13 characters only. No dashes necessary."/>
                        </span>
                        <span style="display:#isbndisplay#">
                            #thisbook.isbn13[1]# 
							<cfif session.user.isadmin>
								<button type="button" onclick="toggleNewISBNForm()" class="btn btn-warning btn-xs">Edit ISBN</button>
							</cfif>
                            <input type="hidden" class="form-control" id="isbn13" name="isbn13" placeholder="ISBN13" value="#thisbook.isbn13[1]#"/>
                        </span>
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">Book Title</label>
          <div class="col-lg-9">
            <input type="text" class="form-control" id="title" name="title" placeholder="Book Title" value="#thisbook.title[1]#" required maxlength="45"/>
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">Year</label>
          <div class="col-lg-9">
            <input type="text" class="form-control" id="year" name="year" placeholder="Year of Publication" value="#thisbook.year[1]#"/>
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">Weight</label>
          <div class="col-lg-9">
            <input type="text" class="form-control" id="weight" name="weight" placeholder="Book Weight (lbs)" value="#thisbook.weight[1]#" />
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">ISBN</label>
          <div class="col-lg-9">
            <input type="text" class="form-control" id="isbn" name="isbn" placeholder="ISBN 10" value="#thisbook.isbn[1]#" />
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">Pages</label>
          <div class="col-lg-9">
            <input type="text" class="form-control" id="pages" name="pages" placeholder="No. Pages" value="#thisbook.pages[1]#" />
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">Publisher</label>
          <div class="col-lg-9">
            <select class="form-control" id="publisher" name="publisher">
              <option value=""></option>
              <cfloop query="allpubs">
                <cfset sel=''>
                <cfif trim(id) eq thisbook.publisher[1]>
                  <cfset sel='selected="selected"'>
                </cfif>
                <option value="#trim(id)#" #sel#>#trim(name)#</option>
              </cfloop>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="title"class="col-lg-3 control-label">Cover</label>
          <div class="col-lg-9"> <img src="../images/#trim(thisbook.image[1])#" height="150">
            <input type="file" class="form-control" id="coverimage" name="uploadimage" />
            <input type="hidden" name="image" value="#thisbook.image[1]#" />
          </div>
        </div>
			  
			  <div class="form-group">
                    <label for="title"class="col-lg-3 control-label">Description</label>
                    <div class="col-lg-9">
                        <textarea id="bookdesc" name="description">#trim(thisbook.description[1])#</textarea>
                        <script>CKEDITOR.replace("bookdesc")</script>
                    </div>
                </div>
			  
                <div class="form-group">
                    <label class="col-lg-12 control-label" style="text-align: left">Genres</label>
                <div class="col-lg-12">
                    <cfloop query="allgenres">
                        <input id="genre#genreid#" type="checkbox" name="genre" value="#genreid#">#genrename# <br/>
                    </cfloop>
                    <cfloop query="bookgenres">
                        <script>document.getElementById('genre#genreid#').checked=true;</script>
                    </cfloop>
					  </div>
                </div>
			  
        <div class="form-group">
          <label class="col-lg-3 control-label">&nbsp;</label>
          <div class="col-lg-9">
            <button type="submit" class="btn btn-primary">Add Book</button>
          </div>
        </div>
      </form>
    </cfoutput>
  </cfif>
</cffunction>
<cffunction name="sidenav">
	
	<cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post"
            class="form-inline">
                <div class="form-group">
                    <input type="text" class="form-control"
                           id="qterm" name="qterm" value="#qterm#">
                <button type="submit" class="btn btn-xs btn-primary">Search</button>
                </div>
        </form>
    </cfoutput>
	
  <cfif qterm neq ''>
        <cfquery name="allbooks" datasource="#application.dsource#">
            select * from books
            where title like '%#qterm#%'
            order by title
        </cfquery>
    </cfif>
  
  <cfoutput>
	<div>Book List</div>
    <ul class="nav nav-stacked">
      <li><a href="#cgi.script_name#?tool=addedit&book=new">Add a Book</a></li><br><br>
		<cfif isdefined('allbooks')>
                <cfloop query="allbooks">
                    <li><a href="#cgi.script_name#?tool=addedit&book=#trim(isbn13)#&qterm=#qterm#">#trim(title)#</a></li>
                </cfloop>
			<cfelse>
				No Search Term Entered (Try Pirate)
            </cfif>
    </ul>
  </cfoutput>
</cffunction>
<cffunction name="processForms">
    <cfif isdefined('form.isbn13')>
        <cfif isdefined('form.uploadimage') and trim(form.uploadimage) neq ''>
            <cffile action="upload" filefield="uploadimage" destination="#expandpath('/')#jbrow48830/images" nameconflict="makeunique" />
            <cfset form.image=cffile.serverfile>
        </cfif>
        <cfif isdefined('form.newisbn13')>
            <cfquery name="updateisbn13" datasource="#application.dsource#">
                update books set isbn13='#form.newisbn13#' where isbn13='#form.isbn13#'
            </cfquery>
            <cfset form.isbn13=form.newisbn13>
        </cfif>
        <cftry>
            <cfquery name="adddata" datasource="#application.dsource#">
                if not exists(select * from books where isbn13='#form.isbn13#')
                insert into books (isbn13,title) values ('#form.isbn13#','#form.title#');
                update books SET
                    title='#form.title#',
                    weight='#form.weight#',
                    year='#form.year#',
                    isbn='#form.isbn#',
                    pages='#form.pages#',
                    image='#form.image#',
                    publisher='#form.publisher#',
                    description='#form.description#'
                where isbn13='#form.isbn13#'
            </cfquery>
			
            <cfquery datasource="#application.dsource#">
                delete from genrestobooks where isbn13='#form.isbn13#'
            </cfquery>
            <cfoutput>
                <cfloop list="#form.genre#" index="i">
                    <cfquery name="putingenres" datasource="#application.dsource#">
                        insert into genrestobooks (isbn13,genreid) values ('#form.isbn13#','#i#')
                    </cfquery>
                </cfloop>
            </cfoutput>
			
            <cfcatch type="any">
                <cfdump var="#cfcatch#">
            </cfcatch>
        </cftry>
    </cfif>
</cffunction> 
