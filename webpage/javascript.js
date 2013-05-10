$(".bar_wrapper").hover(function() {
	var name = $(this).attr("data-name");
	$('#city_name').text(name);
}),
function() {
	$('#city_name').text("");
}