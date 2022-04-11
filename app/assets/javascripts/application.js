// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery.raty.js

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const API_KEY = "8526c7df612efdbc139279c7e3cf8b4c";
const ANNICT_API_KEY = "LdKPXoixYTg1OQ5etphaoz1b4UcGcYtawOAdcwYoS4I"
$(function(){
  $('#btn1').on('click', function() {
    const val = $("#form-1").val();

    var params = { filter_title: val };

    api_call(params);
  });
});
$(function(){
  $('#btn2').on('click', function() {
    const val = $("#anime_season").val();

    var params = { filter_season: val };

    api_call(params);
  });
});

  $(document).on('turbolinks:load',function(){
    const isAnime = document.getElementById('is_anime');
    if (!isAnime) return;
   const val = $("#anime_season").val();
   var params = { filter_season: "2022-spring" };
   api_call(params);
  })


  function api_call( params ){
    console.log(params);
    $.ajax({
      url: "https://api.annict.com/v1/works"+"?access_token=" + ANNICT_API_KEY,
      type:"GET",
      crossDomain: true,
      dataType: 'json',
      headers: {"accept":"application/json","Access-Control-Allow-Origin":"*"},
      data: params,

    }).done(function (data){
      console.log(data);
      $("#title").empty();
      data.works.forEach(anime=>{
        console.log(anime);
        $('<div class="col-md-4"><div class="card mb-4 shadow-sm"><div class="card-body"><img class=" card-img-top'+anime.id+' img-fluid " src="..." alt="Card image cap"><br><a href="/animes/'+anime.id+'" class="card-title'+anime.id+'"></a></div></div>').appendTo("#title");
        $('.card-title'+anime.id).text(anime.title);
        $('.card-img-top'+anime.id).attr("src",anime.images.facebook.og_image_url);
        if (anime.images.facebook.og_image_url) {
          console.log(anime.images.facebook.og_image_url)
          const regex = new RegExp(/http/)
          console.log(regex.test(anime.images.facebook.og_image_url))
          if (regex.test(anime.images.facebook.og_image_url)) {
            const url = new URL(anime.images.facebook.og_image_url);
            if (url.protocol === "http:") {
              console.log('true')
              $('.card-img-top'+anime.id).attr("src",'/noimage-760x460.png');
            }
          }
        } else {
          console.log('true')
          $('.card-img-top'+anime.id).attr("src",'/noimage-760x460.png');
        }
      });
    }).fail(function (data) {
      
      alert('に失敗しました。');
    });
}
