<cfparam name="personid" default="" />
<cfparam name="forgotPassword" default="" />
<cfparam name="content" default="verify" />
<cfset content=processForms()>
<script>
    function validateNewAccount(){
        var originalPassword=document.getElementById('newaccountpassword').value;
        var confirmPassword=document.getElementById('newaccountpasswordconfirm').value;
        console.dir(originalPassword);
        console.dir(confirmPassword);
        if(originalPassword===confirmPassword && originalPassword!==''){
            document.getElementById('submitnewaccountform').click();
            document.getElementById('forgotPassword').innerHTML="";
        }
        else{
            document.getElementById('forgotPassword').innerHTML="The two passwords do not match";
        }
    }
</script>

<cfoutput>
  <div id="forgotPassword">&nbsp;#forgotPassword#</div>
  <cfif content eq 'verify'>
    #provideIdentity()#
    <cfelseif content eq 'changePassword'>
    #resetPassword()#
  </cfif>
</cfoutput>
<cffunction name="processForms">
  <cfif isdefined('form.lastname')>
    <cfquery name="checkInput" datasource="#application.dsource#">
            select * from people where lastname='#form.lastname#' and email='#form.email#'
        </cfquery>
    <cfif checkInput.recordcount gt 0>
      <cfset personid=#checkInput.id[1]#>
      <cfreturn "changePassword">
      <cfelse>
      <cfset forgotPassword="No record found, check that your name or email are typed correctly.">
    </cfif>
  </cfif>
  <cfif isdefined('form.password')>
    <cfquery name="updatepw" datasource="#application.dsource#">
            update passwords
            set password='#hash(form.password,"SHA-256")#'
            where personid='#form.personid#'
        </cfquery>
    <cflocation url="index.cfm?p=login" />
  </cfif>
  <cfreturn "verify">
</cffunction>
<cffunction name="provideIdentity">
  <cfoutput>
    <form action="#cgi.script_name#?p=forgotPassword" method="post" class="form-horizontal">
      <div class="form-group">
        <label class="col-lg-3 control-label">Email Address:</label>
        <div class="col-lg-9">
          <input type="text" name="email" placeholder="Email" class="form-control">
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label">Last Name:</label>
        <div class="col-lg-9">
          <input type="text" name="lastname" placeholder="Last (Family) Name" class="form-control">
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label">&nbsp;</label>
        <div class="col-lg-9">
          <input type="submit" value="Authenticate" />
        </div>
      </div>
    </form>
  </cfoutput>
</cffunction>
<cffunction name="resetPassword">
  <cfoutput>
    <form action="#cgi.script_name#?p=forgotPassword" method="post" class="form-horizontal">
      <input type="text" name="personid" value="#personid#">
      <div class="form-group">
        <label class="col-lg-3 control-label">Password</label>
        <div class="col-lg-9">
          <input type="text" class="form-control" name="password" id="newaccountpassword" required/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label">Confirm Password</label>
        <div class="col-lg-9">
          <input type="text" class="form-control" id="newaccountpasswordconfirm" required/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label">&nbsp;</label>
        <div class="col-lg-9">
          <button type="button" id="newAccountButton" class="btn btn-warning" onclick="validateNewAccount()">Reset Password</button>
          <input type="submit" id="submitnewaccountform" style="display:none" />
        </div>
      </div>
    </form>
  </cfoutput>
</cffunction>
