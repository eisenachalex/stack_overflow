// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){
  $(".increase-vote").click(function(event) {
      event.preventDefault();
      increaseVote($(this));
  });
  $(".decrease-vote").click(function(event) {
      event.preventDefault();
      decreaseVote($(this));
});

function increaseVote(cssObject) {
      var addData = $(cssObject).attr("data"); //you don't need this because the id is passed from the url
      var url  = $(cssObject).attr("href");
      var that = $(cssObject);
      $.post(url, addData, function(response){
        that.next().text(response);
    }, "json");
}

function decreaseVote(cssObject) {
      var subData = $(cssObject).attr("data"); //you don't need this because the id is passed from the url
      var url  = $(cssObject).attr("href");
      var that = $(cssObject);
      $.post(url, subData, function(response){
        that.prev().text(response);
    }, "json");
}

});
