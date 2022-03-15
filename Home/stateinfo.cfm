
<cfif not isdefined('session.user')>
    <cfset makeCleanUser()>
</cfif>

<cfif isdefined('form.loginemail')>
    <cfquery name="access" datasource="#application.dsource#">
        select * from people
        inner join passwords on people.id = passwords.personid
        where email='#form.loginemail#' and password='#hash(form.loginpass,"SHA-256")#'
    </cfquery>

    <cfif access.recordcount gt 0>
        <cfset session.user={
            firstname:access.firstname[1],
            lastname:access.lastname[1],
            email:access.email[1],
            acctnuumber:access.personid[1]
        }>
        <cfset session.isLoggedin=true>
        <cfset p="carousel">
        <cfif access.isadmin[1] neq ''>
            <cfset session.user.isadmin=access.isadmin[1]>
        </cfif>
    <cfelse>
            <cfset loginmessage="Sorry, that log doesn't match">
    </cfif>
</cfif>

<cfif isdefined('url.p') and url.p eq 'logoff'>
    <cfset structClear(session)>
    <cfset session.isLoggedIn=false>
    <cfset makeCleanUser()>
    <cfset p="carousel">
</cfif>





<cffunction name="makeCleanUser">
    <cfset session.isLoggedIn=false>
    <cfset session.user={firstName:'',lastname:'',acctnumber:'',email:'',isAdmin:1}>
</cffunction> 