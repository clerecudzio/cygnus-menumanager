$("#floatMenuheader").click(function(){
	$("#floatMenuContent *").slideToggle('slow','linear');
});

$("#menuHeader").click(function(){
	/**
	 * check both element visibility
	 */
	var fmhVisible = $("#floatMenuheader").is(":visible");
	var fmcVisible = $("#floatMenuContent").is(":visible");
	if((fmcVisible == false)&&(fmhVisible == true)){
		$("#floatMenuheader").animate({width:'toggle'});	
	}else{
		$("#floatMenuheader").animate({width:'toggle'});
		$("#floatMenuContent").animate({width:'toggle'});
	}
});

/**
 * 
 * Javascript event for handling floating menu event
 */
$("#floatMenuContent ul li a").click(function(){
		var objectUrl = $(this).attr('href'); 
		$("#dashboardContent").attr('src',objectUrl);
		return false;
		}
	);