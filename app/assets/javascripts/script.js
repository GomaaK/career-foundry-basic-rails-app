	var refreshRating = function(){ 
	$(".alert")
	.delay(5000)
	.fadeOut(1000);

	$(".rating").raty({path: "/assets", scoreName: "comment[rating]"});

	$(".rated").raty({
		path: "/assets",
		readOnly: true,
		score: function(){
			return $(this).attr("data-score");
		}
	});
};	

$(document).ready(function(){
	refreshRating();
	$(".zoom_img").elevateZoom();
});

