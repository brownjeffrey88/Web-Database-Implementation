<cfparam name="searchme" default="">
<cfparam name="genre" default="">
<cfparam name="publisher" default="">


<cfset bookinfo=makeQuery()>



<cfoutput>
    <legend>#bookinfo.label#</legend>
    <cfif bookinfo.booksQuery.recordcount eq 0>
        #noResults()#
    <cfelseif bookinfo.booksQuery.recordcount eq 1>
        #oneResult(bookinfo.booksQuery)#
    <cfelse>
        #manyResults(bookinfo.booksQuery)#
    </cfif>
</cfoutput>


<cffunction name="makeQuery">
    <cfset bookInfo={booksQuery:queryNew("title")}>

    <cfif genre neq ''>
        <cfquery name="whatGenre" datasource="#application.dsource#">
            select * from genres where genreid='#genre#'
        </cfquery>
        <cfquery name="booksQuery" datasource="#application.dsource#">
            select * from books
            inner join publishers on books.publisher = publishers.id
            inner join genrestobooks on books.isbn13 = genrestobooks.bookid
            where genreid='#genre#'
        </cfquery>
        <cfset bookinfo.label="Genre:#whatGenre.genrename[1]#">

    <cfelseif searchme neq ''>
        <cfquery name="booksQuery" datasource="#application.dsource#">
            select * from books
            inner join publishers on books.publisher = publishers.id
            where title like '%#trim(searchme)#%' or isbn13='#searchme#' or genre='#searchme#'
        </cfquery>
        <cfset bookinfo.label="Keyword:#searchme#">
    <cfelseif publisher neq ''>
        <cfquery name="booksQuery" datasource="#application.dsource#">
            select * from books
            inner join publishers on books.publisher = publishers.id
            where publishers.ID ='#publisher#'
        </cfquery>
        <cfset bookinfo.label="Publisher:#booksQuery.name#">
    </cfif>

    <cfset bookinfo.booksQuery=booksquery>
    <cfreturn bookinfo>
</cffunction>


<cffunction name="noResults">
    We did not find anything with that term. Please Try Again.
</cffunction>

<cffunction name="oneResult">
    <cfargument name="bookQ" type="query" required="true">
    <div>
        <cfoutput>
            <img src="../images/#bookQ.image[1]#" style="float:left; width:250px; height:250px;">
			<span>Year Published: #bookQ.year[1]#</span><br/>
            <span>Title: #bookQ.title[1]#</span><br/>
        <span>Publisher: <a href="#cgi.script_name#?p=details&publisher=#bookQ.publisher#">#bookQ.name[1]#</a></span>
            <span>#bookQ.description[1]#</span>
        </cfoutput>
    </div>
</cffunction>


<cffunction name="manyResults">
    <cfargument name="bookQ" type="query" required="true">

    <ol class="nav nav-stacked">
        <cfoutput query="arguments.bookQ">
            <li><a href="#cgi.script_name#?p=details&searchme=#trim(isbn13)#">#trim(title)#</a></li>
        </cfoutput>
    </ol>
</cffunction> 