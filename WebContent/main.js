
(function(){
	$("#clear").on("click",function(){
		$(".input_box")[0].value="";
		$(".input_box")[1].value="";
	});
	$("#login").on("click",function(){
		$.ajax({
			"type":"get",
			"url": "doCheck.jsp",
			"data": "user="+$(".input_box")[0].value+"&password="+$(".input_box")[1].value,
			"success":function(data){
				console.log(data);
			},
			"error":function(xhr,err){
				if (xhr.status==200)
				if(xhr.response.match(/false/g)){
					alert("Login Error~~")
				}else{
					location.href="main.jsp"
				}
			}
		})
	});
})();