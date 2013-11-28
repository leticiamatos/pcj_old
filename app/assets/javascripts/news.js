CJ.noticias = {
	init: function(){
		CJ.carousel('.carousel-vertical');
		CJ.banner('#news-banner-content', 8000);
	}
}

$(window).load(function(){
	CJ.noticias.init();
});