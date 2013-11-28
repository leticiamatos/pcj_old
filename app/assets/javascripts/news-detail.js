CJ.noticiasDetalhe = {
	init: function(){
		CJ.carousel('.carousel-vertical', 1, 'slow', 5);
	}
}

$(window).load(function(){
	CJ.noticiasDetalhe.init();
});