(function(jwplayer){

  var template = function(player, config, div) {
    
	var flag = 0;
    player.onTime(_show);
    
    function _show(event) {
        div.innerHTML = config.text;
		flag++;
		if(flag>10) {
			flag = 0;
			_style({
				margin: (Math.floor((config.height-60)*Math.random()) + 5)+'px '+(Math.floor((config.width-90)*Math.random()) + 5)+'px'
			});
		}
    };
    
    this.resize = function(width, height) {
        _style({
            position: 'absolute',
            color: 'gray',
            fontSize: '12px',
			height: '20px',
			width: '95px',
            opacity: 1
        });
    };
    
    function _style(object) {
        for(var style in object) {
          div.style[style] = object[style];
        }
     };
  };

  jwplayer().registerPlugin('cpf', template);

})(jwplayer);