CJ.downloads = {
	init: function(){
		$('.mod-accordion dt').on('click', CJ.downloads.accordion);
	},
	accordion: function(){

		var container = $(this).parents('.mod-accordion');
		var content   = $(container).children('dd');
		console.log(container);
		if($(container).hasClass('open')){
			$(container).removeClass('open');
			$(content).stop().slideUp('fast');
		}else{
			$('.mod-accordion').removeClass('open');
			$('.mod-accordion').children('dd').slideUp('fast');
			$(container).addClass('open');
			$(content).stop().slideDown('fast');
		}
	}
}

$(window).load(function(){
	CJ.downloads.init();
});