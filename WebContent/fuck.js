$(function() {
	$("#mod_user").hide();
	$(".delete").on("click", function() {
		if (confirm("Delete?")) {
			// console.log(this.getAttribute("user_id"));
			$.ajax({
				"type" : "get",
				"url" : "doDel.jsp",
				"data" : "user_id=" + this.getAttribute("user_id"),
				"success" : function(data) {
					console.log(data);
				},
				"error" : function(xhr, err) {
					if (xhr.status == 200)
						console.log(xhr);
					if (xhr.response.match(/false/g)) {
						alert("Failed to Del!");
					} else {
						alert("Success!");
						// $("#tr" + this.getAttribute("user_id")).hide()
					}
					// history.go(0);
					location.reload();
				}
			});
		}
	});
	$("#add_user")
			.on(
					"click",
					function() {
						var name = $("#name")[0].value;
						var nick = $("#nick")[0].value;
						var age = $("#age")[0].value;
						var phone = $("#phone")[0].value;
						var sex = $("#sex")[0].checked ? "M" : "F";
						$
								.ajax({
									'type' : 'get',
									'url' : 'doAdd.jsp',
									'data' : {
										"name" : name,
										"nick" : nick,
										"age" : age,
										"phone" : phone,
										"sex" : sex
									},
									'success' : function(data) {
										console.log(data);
									},
									"error" : function(xhr, err) {
										if (xhr.status != 200) {
											alert("Add user Error!");
										}
										if (xhr.status == 200)
											if (xhr.response.match(/false/g)) {
												alert("Failed to Add!");
											} else {
												alert("Success!");
												$("#tb_user")
														.append(
																'<tr align="center" height="30" id="tr'
																		+ name
																		+ '">'
																		+ '<td>'
																		+ name
																		+ '</td>'
																		+ '<td>'
																		+ nick
																		+ '</td>'
																		+ '<td>'
																		+ age
																		+ '</td>'
																		+ '<td>'
																		+ sex
																		+ '</td>'
																		+ '<td>'
																		+ phone
																		+ '</td>'
																		+ '<td><a class="delete" user_id='
																		+ name
																		+ ' href="#"><span'
																		+ 'class="red">[delete/</span></a><a class="modify" user_id='
																		+ name
																		+ ' href="#"><span'
																		+ 'class="red">modify]</span></a></td></tr>');
												location.reload();
												// $("#tr" +
												// this.getAttribute("user_id")).hide()
											}
									}
								});
					});
	$(".modify").on(
			"click",
			function() {
				var user = this.getAttribute("user_id");
				var attrs = [ "name", "nick", "age", "sex", "phone" ];
				var attrv = {};
				for ( var v = 0; v < attrs.length; ++v) {
					var i = attrs[v];
					attrv[i] = $("#" + user + i).text();
					// console.log(i+","+attrv[i]);
					if (i != "sex") {
						$("#" + i)[0].value = attrv[i];
						continue;
					}
					attrv[i] == "M" ? $("#" + i)[0].checked = true : $("#" + i
							+ '2')[0].checked = true;
				}
				$("#mod_user").show();
				$("#add_user").hide();
			});
	$("#mod_user").on("click", function() {
		var name = $("#name")[0].value;
		var nick = $("#nick")[0].value;
		var age = $("#age")[0].value;
		var phone = $("#phone")[0].value;
		var sex = $("#sex")[0].checked ? "M" : "F";
		$.ajax({
			'type' : 'get',
			'url' : 'doModify.jsp',
			'data' : {
				"name" : name,
				"nick" : nick,
				"age" : age,
				"phone" : phone,
				"sex" : sex
			},
			'success' : function(data) {
				console.log(data);
			},
			"error" : function(xhr, err) {
				if (xhr.status == 200)
					if (xhr.response.match(/false/g)) {
						alert("Failed to Modify!");
					} else {
						alert("Modify Success!!");
						location.reload();
					}
			}
		});
		$("#mod_user").hide();
		$("#add_user").show();
	});
});