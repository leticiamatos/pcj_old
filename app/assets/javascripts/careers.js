CJ.carreiras = {
	init: function(){
		CJ.carousel('#videos-carousel', 1, 'slow', 1);
	}
}

$(window).load(function(){
	CJ.carreiras.init();
});