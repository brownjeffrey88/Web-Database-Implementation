<cfquery name="books" datasource="#application.dsource#">
            select * from books
        </cfquery>

<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>
  

  <div class="carousel-inner">
    <div class="item active">
      <h3 class="col-lg-offset-2">Store Hours</h3>
      <table class="table" style="width:65%; margin-left:auto;margin-right:auto">
        <tbody>
          <tr>
            <th>Day</th>
            <th>Hours</th>
          </tr>
          <tr>
            <td>Monday</td>
            <td>10am-6pm</td>
          </tr>
          <tr>
            <td>Tuesday</td>
            <td>10am-6pm</td>
          </tr>
          <tr>
            <td>Wednesday</td>
            <td>10am-6pm</td>
          </tr>
          <tr>
            <td>Thursday</td>
            <td>10am-6pm</td>
          </tr>
          <tr>
            <td>Friday</td>
            <td>10am-9pm</td>
          </tr>
          <tr>
            <td>Saturday</td>
            <td>10am-9pm</td>
          </tr>
          <tr>
            <td>Sunday</td>
            <td>Noon-6pm</td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
    </div>
    <cfoutput>
		<cfloop query="books">
			<div class="item"> <img src="../images/#books.image#
		" alt="#books.title#" style="margin-left:auto; margin-right:auto"><br>
        <br>
        <br>
        <br>
        <div class="carousel-caption">
          <p>#books.title#</p>
        </div>
      </div>
		</cfloop>
      
    </cfoutput> </div>
  
  <a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span> </a> </div>
