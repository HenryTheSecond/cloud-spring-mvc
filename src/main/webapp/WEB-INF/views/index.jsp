<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<label for="source">Source</label>
	<textarea id="source" name="source" rows="4" cols="50">
	</textarea>
	
	<label for="destination">destination</label>
	<textarea id="destination" name="destination" rows="4" cols="50">
	</textarea>
	
	<div id="submit">Submit </div>
	
	<script src="jquery-3.5.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		const submit = document.getElementById("submit")
		submit.onclick = function(){
			console.log(document.getElementById("source").value)
			fetch("/api/translate",{
				method : "post",
				body: JSON.stringify({
					"source": document.getElementById("source").value
		        }),
		        headers: {
		            "Content-Type": "application/json"
		        }
			}).then(function(res){
				return res.json()
			}).then(function(data){
				document.getElementById("destination").value = data.destination
			})    		
		}
	</script>
</body>
</html>