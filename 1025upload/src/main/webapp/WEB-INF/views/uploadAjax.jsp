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
<div class="thumbs">

</div>
<style>
.imgBox{
	width: 100%;
	height: 100vh;
	position: absolute;
	top:0px;
	left:0px;
	background-color: gray;
	display: none;
}

</style>
<div class="imgBox">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(".thumbs").on("click", "img", function(e){

	var obj = $(this);
	console.log(obj);
	$(".imgBox").html("<img src='/viewFile/"+obj.attr("data-src")+"'>").show('slow');
	
	
});

$(".imgBox").on("click", function(e){
	$(this).hide("slow");
});


$("#btn").on("click", function (e) {
	var thumbs = $(".thumbs");
	
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
			var str = "";
			for (var i = 0; i < result.length; i++) {
				
				var path = "/viewFile/"+result[i].thumbName+"_"+result[i].ext;
				var fileSrc = (result[i].thumbName+"_"+result[i].ext).substring(2)
				
				str += "<div>";
				str += "<img data-src='"+fileSrc+"' src='"+path+"'>";
				str += "<p>" + result[i].originName+"</p>";
				str += "</div>";
				
				
			}
			thumbs.append(str);
		}
	});
	
	
});

</script>

</body>
</html>