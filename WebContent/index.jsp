<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HTML Test</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    function demo(b,contextPath){
        var name;
        var cost;
        if(b=="1")
        {
          name = "Diagnostic Test 1";
        }
        else if(b=="2")
        {
          name = "Diagnostic Test 2";
        }
        else if(b=="3")
        {
          name = "Diagnostic Test 3";
        }
        else if(b=="4")
        {
          name = "Diagnostic Test 4";
        }
        try{
          contextPath = contextPath.substr(1);
          var xhr = new XMLHttpRequest();
          var url = contextPath +"/MyServlet?id="+b;
          xhr.open("GET", url, true);

          xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
            	cost = xhr.responseText;
               // alert("Inside Demo "+ url + " " +cost);
            	adddiagnostic(name,xhr.responseText);
              	
              	
            } else {

              //alert(" Error in Ajax Contact to Developer "+xhr.readyState+" and "+xhr.status)
              }
          };
          xhr.send();
        
        }
        catch (e) {
          alert("Ajax Exception ");
        }
          
      };

        function validateForm() {
            var x = document.forms["myForm"]["name"].value;
            console.log(x)
            var validated = true
            if (x.length <= 3) {
                alert("Name must be greater than 3 characters");
                validated = false;
                document.getElementById("name").focus();
                return validated;
                
            }

            var letters = /^[A-Za-z ]+$/;
            if (!x.match(letters)) {
                alert("Name should only have alphabets.");
                validated = false;
                document.getElementById("name").focus();
                return validated;
            }

            var age = document.forms["myForm"]["age"].value;
            if(age.match(letters)){
            	alert("Age should be Integer");
            	validated=false;
                document.getElementById("age").focus();
                return validated;
            }
            else{
            age = Number(age);
            if (age <= 0) {
                alert("Age should be greater than 0");
                validated = false;
                document.getElementById("age").focus();
                return validated;
            } else if (age > 4) {
                if (age % 1 != 0) {
                    alert("Age > 4 cannot be in float format");
                    validated = false
                    document.getElementById("age").focus();
                    return validated;
                }
            }}
            return validated;
        };

        function adddiagnostic(x,b) {
            var diagnoisticNames = document.getElementById("daignostics-name");
            var diagnoisticCosts = document.getElementById("daignostics-cost");

            var node = document.createElement("li");
            node.className = "list-group-item border-0";
            var textnode = document.createTextNode(x);
            node.appendChild(textnode);
            diagnoisticNames.appendChild(node);

            var node = document.createElement("li");
            node.className = "list-group-item border-0 text-right";
            var textnode = document.createTextNode(b);
            node.appendChild(textnode);
            diagnoisticCosts.appendChild(node);

            var totalCost = document.getElementById("totalCost");
          totalCost.innerHTML = Number(totalCost.innerHTML) + Number(b);

        };
    </script>

</head>

<body>
    <div class="content">
        <div class="col-md-6 border m-5">
            <div class="row">
                <div class="col-md-12">
                    <h1>Diagonostics</h1>
                    <form action="" method="GET" onsubmit="return validateForm();" id="myForm">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Name</label>
                            <div class="col-sm-8">
                                <input type="text" id = "name" class="form-control" name="name" placeholder="Enter the Name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Age</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="age" name="age" placeholder="Enter the Age">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Gender</label>
                            <div class="col-sm-8">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="Gender" id="inlineRadio1" value="Male">
                                    <label class="form-check-label" for="inlineRadio1">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="Gender" id="inlineRadio2" value="Female">
                                    <label class="form-check-label" for="inlineRadio2">Female</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label" for="inputState">Diagnostic Test</label>
                            <div class="col-sm-5">
                                <select id="inputState" name="diagnostics" class="form-control" onchange="demo(this.value,'/${pageContext.request.contextPath}')">
                                  <option  value="1">Diagnostic Test 1</option>
                                  <option  value="2">Diagnostic Test 2</option>
                                  <option  value="3">Diagnostic Test 3</option>
                                  <option  value="4">Diagnostic Test 4</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mb-2">Submit</button>
                </div>
                </form>
            </div>
            <div class="row">
                <div class="col-md-6 border-top">
                    <ul class="list-group" id="daignostics-name">
                    </ul>
                    <hr/>
                    <li class="list-group-item border-0">Total Cost</li>
                </div>
                
                <div class="col-md-6 border-top">
                    <ul class="list-group" id="daignostics-cost">
                    </ul>
                    <hr/>
                    <li class="list-group-item border-0 text-right" id="totalCost">0</li>
                </div>
            </div>
        </div>

    </div>
    </div>
    </div>
</body>

</html>
