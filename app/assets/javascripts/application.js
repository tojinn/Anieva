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


$(function(){
  $('#btn').on('click', function() {

  });
});

// （API_KEY には、"取得したAPIキー" を記述）
const API_KEY = "8526c7df612efdbc139279c7e3cf8b4c";
const ANNICT_API_KEY = "LdKPXoixYTg1OQ5etphaoz1b4UcGcYtawOAdcwYoS4I"
$(function(){
  $('#btn').on('click', function() {
           const params = $(".search__form__input").val()

    $.ajax({
      url: "https://api.annict.com/v1/works"+"?access_token=" + ANNICT_API_KEY,
      type:"GET",
      crossDomain:true,
      dataType : 'json',
      headers:{"accept":"application/json","Access-Control-Allow-Origin":"*"},
      data: {
        filter_season:params

      },
    }).done(function (data){
      data.works.forEach(anime=>{
        console.log(anime);
        $('<div class="card" style="width: 18rem;"><img class="card-img-top'+anime.id+'" src="..." alt="Card image cap"><div class="card-body"><a href="/animes/'+anime.id+'" class="card-title'+anime.id+'">Card title</a><p class="card-text">Some quick example text to build on the card title and make up the bulk of the cards content.</p><a href="#" class="btn btn-primary">Go somewhere</a></div></div>').appendTo("#title");
        $('.card-title'+anime.id).text(anime.title);
       /* if(err) {
        $('.card-img-top'+anime.id).attr("src","data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADSCAMAAABD772dAAAAeFBMVEX///8AAAAbGxuYmJjw8PCPj4/T09M/Pz/09PR+fn5XV1fl5eX7+/u8vLz4+Pipqam1tbWlpaXf39+wsLAoKCjMzMynp6dFRUUYGBjZ2dktLS0REREiIiJRUVGIiIjAwMA0NDRtbW12dnZgYGBmZmY4ODidnZ1BQUGr+YqAAAAFB0lEQVR4nO2c6ZaiOhRGc2QoBAWknBVn7fd/w5scZsRqrbtoK6lv/6gGxV7ZnoyHoBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4lbjWsMYuHr27QP1iL6jN57vL1CeBMvRrXOW507xm9p6i9UK4JIqbLwV/iPa189Gh/QXozIHoPn5rIrtxSXx3ia74nQ3WJjoUxyNpP/l3BeqZ411zzYiJdtmRrM8G+TpEp+53TkUzNiq+E6Lzo/cO3IxVfZ7/yyL1wShxMz6JBu4DVrJSL1buVfkmybuL/H9IznfTjC+JxFj+vQTvLvd3iV7TVe13xgeaDkwqWlFgP4NnT1V8JWEgG3vHaK0BIzm+PrsyUONRVJx4W6KeytQrMlLPNkbVP0fVaaJnpfYfD0MtRtOGrxApHXsoUN9MyXruwlZ8JTv600OB+mbwpHAV32SSd1YOffRVqh55LOxa/mGzXZxiT56Epa8akrKZllnC0aAaeeUco2q/apay4SOThFdLpXW0osmOsz3Lasko1xB05SODhOdS6uzmJ958S63xN5tJmyMsx+aNWzu/NlMCRebDGOG9rLO1yZfqrzpzlqYIh0TT+mnmG27T9kdNET410nXhNotv0p52GCNsU/2Vqj6f79YKhghbRFUDLuIrOMT75pWGCF9rSbxGf3VtrxXMEJbr43FxXIuvUKHfNj9qhnBSrY+bvmq0amYKzBCelX10y1e4jd5bGCccDloZjVU7N2KGcKHVji9/FWHjBTOEvWz0Ub6tjNW8PRCbISxXvruO+izUzMNvvmCI8E4GsiO+aorduoVmiLAcl27TjgysQ+S1XzFCWN0Q7/C172+jmiK86rxtdL0LsCnCXkf75bB3VHIThD3un71hPcUj7Gu536GGEcLehkMpu+pTOa0K5Yqxw9cIYS8ff3lrWnqbJcksujy6F2yAsFdtSbPq98BP7f6K0V9Y+ZaLYRFfMtt0Ynd9UFfhbSXs3W05DIOgM7YZegqn5XxC9VfjL69tcX761vJPwinWQM36/ARycn3ro0Q9I6eMF/Xvy/FVc5Ev6vvPRYY4TV6P72qhZ4AF7yZlpO8nDZ6EB6t3l/y7fBa+sgd7AR238OR4ua8IrGeZuH/7T38wr/dXeqN893+/zBjs3xZf+l3xVZuHf5WvCIdabgIGAAAAgG7MOGUx4ZlWOHGqBW5ieXLSaa2y4yxLG+UTlDDaZVsh4onkptUzeTu+xc2Zi4RoTetiW9JY7fMI6KCOfeKlr01rfitQF3IyK6XlZqPXusPhHTs0lIcfy5FYlTeQcmH16Jn8y8K3fLOLL2VtzvulizcV+/tI4UUmPOJ0/EexQ7gQTjnjxcLb05q/Dv56ZqpSayi8ozFFubB6UCW95m/kwhdKPDqycEKuxQlscoQd2KpZ+9NoctOqRkthVUM3pbB/yN/Ihffro0UuC8tLA364UgqrNKfIt0bode9BWtjkb1lYdV9lJS2E90TzFQvTMQh4N61s57Z9IqFpleYcrWqVLLO55G/kwmOxJMER3meZWdmLc0zTg9BWWI4uStghx72UDwSXwsEqE75sPNt2VSr6Rjt3yJsS/fU+jmOtnhMfKmE7u4Pg1FPrcSbM5zMp7GUDFg/FFuU71LLf6zH6N3pyDP/lJQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPrmP8siNgAtARo3AAAAAElFTkSuQmCC");
        }else{
        }*/
        $('.card-img-top'+anime.id).attr("src",anime.images.facebook.og_image_url);


  /*      $('<img src='+ anime.images.facebook.og_image_url +'></img>').appendTo("#title");*/
      });
      // 位置
    }).fail(function (data) {
      //通信失敗
      alert('通信に失敗しました。');
    });

    })
});

/*$(function(){
  $('#btn').on('click', function() {
    // 入力された都市名でWebAPIに天気情報をリクエスト
    $.ajax({
      url: "https://api.openweathermap.org/data/2.5/weather?q=" + $('#cityname').val() + "&units=metric&appid=" + API_KEY,
      dataType : 'jsonp',
    }).done(function (data){
      // 位置
      $('#place').text(data.name);
      // 最高気温
      $('#temp_max').text(data.main.temp_max);
      // 最低気温
      $('#temp_min').text(data.main.temp_min);
      //湿度
      $('#humidity').text(data.main.humidity);
      //風速
      $('#speed').text(data.wind.speed);
      // 天気
      $('#weather').text(data.weather[0].main);
      // 天気アイコン
      $('img').attr("src","http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
      $('img').attr("alt",data.weather[0].main);
    }).fail(function (data) {
      //通信失敗
      alert('通信に失敗しました。');
    });

    })
});*/