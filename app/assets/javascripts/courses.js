$(".courses-tab-a > span").lettering('words');
$.ajaxSetup({ cache: false });

$('#content').on("click", function(){
  $('.mod-courses-box-pagination').on('ajax:success', function(event, data){
    group_id = $('.new-mod-courses-box.tab.current').find('#current-group').val()
    page = $(data).find('#group-'+group_id);
    $('.new-mod-courses-box.tab.current').empty();
    $('.new-mod-courses-box.tab.current').html(page.html());
  });
});

$("#btn-search-course").on("click", function(){
  search = $("#q").val();
  $.post('/curso/pesquisa', { search: search }, function(data){
    $(data).ready(function(){
      $('#load-search').empty();
      $('#load-search').html(data);
    });
  });
});