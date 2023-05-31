console.log("like");
var likeService = (function(){
	function up(likeVO, callback, error){
		console.log("add");
		
		$.ajax({
			type : 'post',
			url : '/like/up',
			data : JSON.stringify(likeVO),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function down(bno, userId, callback, error){
		console.log("down");
		$.ajax({
			type : 'delete',
			url : '/like/' + bno + '/' + userId,
			data : JSON.stringify({bno : bno, userId : userId}),
			contentType : "application/json; charset=utf-8",
			success : function(downResult){
				if(callback){
					callback(downResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getState(bno, userId, callback, error){
		$.get("/like/" + bno + "/" + userId,
			function(result){
				if(callback){
					callback(result);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	return {up : up, down : down, getState : getState};
	
})();