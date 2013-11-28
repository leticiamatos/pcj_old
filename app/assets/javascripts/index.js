CJ.inicio = {
	init: function(){
		CJ.carousel('.carousel-vertical', 2, 'slow', 1);
		CJ.carousel('#courses-carousel', 1, 'slow', 1);
		CJ.carousel('#teachers-carousel', 1, 'slow', 1);
		CJ.inicio.banner();
				
		$('.teachers-carousel-li .teachers-box:nth-child(2n)').css('margin-right', 0);
		$("#btn-search-course").on("click", function(){
	      search = $("#q").val();
	      $.post('/curso/pesquisa', { search: search }, function(data){
	        $(data).ready(function(){
	          $('#load-search').empty();
	          $('#load-search').html(data);
	        });
	      });
	    });
	},
	banner: function(){
		$('#banner-content').cycle({
			fx: 'scrollHorz',
			easing: 'easeInOutCirc',
			prev: '#banner-prev',
			next: '#banner-next',
			timeout: 8000
		});
	}
}

$(window).load(function(){
	CJ.inicio.init();
});