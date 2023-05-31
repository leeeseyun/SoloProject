var messageService = (function(){
	function check(sender, receiver, callback, error){
		console.log("check");
		
		$.getJSON("/message/check/" + sender + "/" + receiver,
			function(count){
				if(callback){
					callback(count);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getChatOf(sender, receiver, callback, error){
		console.log("getChatOf");
		
		$.getJSON("/message/select/" + sender + "/" + receiver,
			function(data){
				if(callback){
					callback(data);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function sendMessage(message, callback, error){
		console.log("sendMessage");
		
		$.ajax({
			type : 'post',
			url : '/message/send',
			data : JSON.stringify(message),
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
		})
	}
	
	function getMyChatListCheck(sender, callback, error){
		console.log("check");
		$.getJSON("/message/check/" + sender,
			function(check){
				if(callback){
					callback(check);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getMyChatList(sender, callback, error){
		console.log("getMyChatList");
		
		$.getJSON("/message/select/" + sender,
			function(data){
				if(callback){
					callback(data);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		if(gap <(1000 * 60 * 60 * 24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	}
	
	return {check : check, getChatOf : getChatOf, sendMessage : sendMessage, getMyChatListCheck:getMyChatListCheck, getMyChatList:getMyChatList, displayTime:displayTime};
})();