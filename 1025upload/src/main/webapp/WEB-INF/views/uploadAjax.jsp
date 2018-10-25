<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Ajax Upload Page</h1>
<input type="file" id="files" multiple="multiple">
<button id="btn">aaa</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$("#btn").on("click", function (e) {
	var filesObj = $("#files");
	console.log(filesObj);
	var formData = new FormData();
	var files = filesObj[0].files;
	
	for (var i = 0; i < files.length; i++) {
		formData.append("files", files[i]);
	}
	
	$.ajax({
		url:"/upload",
		processData:false,
		contentType:false,
		data:formData,
		type:"POST",
		success:function(result){
			alert(result);
			console.log(result);
		}
	});
	
	
});

</script>

</body>
</html>