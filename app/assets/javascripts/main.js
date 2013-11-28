var CJ = CJ || {};

CJ = {
	init: function(){
		
		$('.mod-cursos ul.abas li').on('click', CJ.abas);
		
		CJ.accordion();

		/* Lettering nas abas de cursos */
		$(".courses-tab-a > span").lettering('words');

		$('#btn-search-course').on('click', function(e){
			e.preventDefault;
			$('#courses-result').fadeIn('fast');
			$('#courses-featured').fadeOut('fast');

			return false;
		});

		$('#btn-close-courses-result').on('click', function(){
			$('#courses-featured').fadeIn('fast');
			$('#courses-result').fadeOut('fast');
		});

		if(!Modernizr.input.placeholder){
			$('[placeholder]').focus(function() {
			  var input = $(this);
			  if (input.val() == input.attr('placeholder')) {
				input.val('');
				input.removeClass('placeholder');
			  }
			}).blur(function() {
			  var input = $(this);
			  if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.addClass('placeholder');
				input.val(input.attr('placeholder'));
			  }
			}).blur();
			$('[placeholder]').parents('form').submit(function() {
			  $(this).find('[placeholder]').each(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
				  input.val('');
				}
			  })
			});
		}
	},
	carousel: function(carousel, scroll, animation, visible) {
		var vertical = false;
		var animation = animation;
		var scroll = scroll;
		var visible = visible;
		
		if( carousel.indexOf('vertical') != -1){
			var vertical = true;	
		}
		$(carousel).jcarousel({
				scroll: scroll,
				vertical: vertical,
				animation: animation,
				easing: 'easeOutCirc',
				itemFallbackDimension: 232
		});
		if(visible >= 4){
			visible = visible - 3;
			var heightAtual = 220;
			var heightClip = visible * 76; /* 76 = altura + margem de cada item */
			var heightNova = (heightAtual + heightClip) + 'px';
			$('.jcarousel-container-vertical, .jcarousel-clip-vertical').css({'height': heightNova});
		}
	},
	banner: function(banner, timeout){
		$(banner).cycle({
			fx: 'scrollHorz',
			easing: 'easeInOutCirc',
			prev: '#banner-prev',
			next: '#banner-next',
			timeout: timeout
		});
	},
	abas: function(){
		var _that = this;
		$('.mod-cursos ul.abas li').removeClass('current').filter($(_that)).addClass('current');
		$(_that).parents('.mod-cursos').children('div').children('div').removeClass('current').eq( $(_that).index() ).addClass('current');
	},
	accordion: function(){
	
		
	}

	
}

$(window).load(function(){
	CJ.init();
		

	/*
	 * Facebook 
	 */
	(function(d, s, id){var js, fjs = d.getElementsByTagName(s)[0];if (d.getElementById(id)) return;js = d.createElement(s); js.id = id;js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";fjs.parentNode.insertBefore(js, fjs);}(document, 'script', 'facebook-jssdk'));

	/*
	 * Google plus
	 */
	window.___gcfg = {lang: 'pt-BR'};
	(function() {
	var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	po.src = 'https://apis.google.com/js/plusone.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	})();

	/*
	 * Twitter
	 */
	 !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');

	 /*
	  * IE
	  */
	if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) { 
	 	var ieversion=new Number(RegExp.$1)
	 	if (ieversion <= 8){

	 		$('.courses-featured-ul li:nth-child(4n)').css({'margin-right' : 0});

		}
	}
	
});