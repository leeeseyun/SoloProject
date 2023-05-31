console.log("memberProfile");
var memberProfileService = (function(){
	
	function getMemberProfile(userId, callback, error){
		$.getJSON("/memberProfile/get/" + userId,
			function(data){
				if(callback){
					callback(data);
				}
			}
		).fail(function(xhr, status, error){
			if(error){
				error();
			}
		});
	}
	return {getMemberProfile : getMemberProfile};
})();