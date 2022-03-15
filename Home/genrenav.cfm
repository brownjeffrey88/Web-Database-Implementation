<cfquery name="allgenres" datasource="#application.dsource#">
    select distinct genres.genreid,genres.genrename from genrestobooks
    inner join genres on genres.genreid = genrestobooks.genreid
    order by genres.genrename
</cfquery>
<ul class="nav nav-stacked">
    <cfoutput query="allgenres">
        <li><a href="#cgi.script_name#?p=details&genre=#genreid#">#genrename#</a></li>
    </cfoutput>
</ul>