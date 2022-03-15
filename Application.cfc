<cfcomponent>
	<cfset this.name="jbrow48830">
	<cfset this.dsource='jbrow48830'>
    <cfset this.sessionmanagement="true">
	<cffunction name="onApplicationStart">
    	<cfset application.dsource='jbrow48830'>
    </cffunction>

	<cffunction name="onRequestStart">
		<cfif not isdefined('session.firstname')>
			<cfset session.firstname="">
		</cfif>
		<cfif not isdefined('session.lastname')>
			<cfset session.lastname="">
		</cfif>
	</cffunction>
</cfcomponent>